class User < ActiveRecord::Base

  validates :email, :uniqueness=>true, :format=>{:with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "we need a valid email address!"}
  validates :password, :length=>{:minimum => 4}, :on => :create, :unless=>Proc.new{|u| u.service_mode?}                
  validates_confirmation_of :password

  attr_accessor :password, :mode
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :mode, :activation_code, :activated_at,
                  :updates_blog_posts, :updates_news

  before_save :prepare_password
  before_save { self.email = email.downcase }

  default_scope where("users.deleted_at IS NULL")

  def destroy
   update_attribute(:deleted_at, Time.now.utc)
  end                  
  
  def service_mode?
    mode=="service"
  end

  # Auth support
  
  def pending?
    state == 'pending'
  end

  def active?
    # the existence of an activation code means they have not activated yet
    state == 'active' && activation_code.nil?
  end

  def new_code
    SecureRandom.hex(6)
  end

  def make_reset_code
    self.reset_code = new_code
    self.reset_code_at = Time.now.utc
  end

  def send_welcome_email!
    transaction do
      UserMailer.welcome(self).deliver
      self.activation_email_sent_at = Time.now
      self.save!
    end
  end

  def send_reset_password_email!
    if self.deleted_at.nil?
      transaction do
        make_reset_code
        save!
        UserMailer.recovery_service(self).deliver
      end
    end
  end

  def self.authenticate(login, pass)
    user = self.where(["email=?", login]).first
    return user if user && user.matching_password?(pass) && user.deleted_at.nil?
  end

  def matching_password?(pass)
    self.password_hash == encrypt_password(pass)
  end
  
  private
  
  def prepare_password
    unless password.blank?
      self.password_salt = Digest::SHA1.hexdigest([Time.now, rand].join)
      self.password_hash = encrypt_password(password)
    end
  end
  
  def encrypt_password(pass)
    Digest::SHA1.hexdigest([pass, password_salt].join)
  end


end
