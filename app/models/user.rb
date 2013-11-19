class User < ActiveRecord::Base

  validates :username, :length=>{:minimum => 3}, :uniqueness=>true, :format=>{ :with => /^[-\w\._@]+$/i, :message => "should only contain letters, numbers, or .-_@"}
  validates :email, :uniqueness=>true, :format=>{:with => /^[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}$/i, :message => "we need a valid email address!"}
  validates :password, :length=>{:minimum => 4}, :on => :create, :unless=>Proc.new{|u| u.service_mode?}                
  validates_confirmation_of :password

  attr_accessor :password, :mode
  attr_accessible :email, :password, :password_confirmation, :firstname, :lastname, :mode, :activation_code, :activated_at

  before_save :prepare_password

  default_scope where("users.deleted_at IS NULL")

  def destroy
   update_attribute(:deleted_at, Time.now.utc)
   # run_callbacks(:destroy) #explicitly run the destroy callbacks to set dependents attribute
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

  def inactive?
    state == 'inactive'
  end

  def activate!
    self.state = 'active'
    self.activated_at = Time.now.utc
    self.activation_code = nil
    save(:validate=>false)
  end

  def inactivate!
    self.state = 'inactive'
    self.activated_at = nil
    self.activation_code = nil
    save(:validate=>false)
  end 

  #generates an activation code and sets state to pending
  def register!
    self.state = "pending"
    self.activation_code = new_code
    self.activated_at = nil    
    save(:validate=>false)
  end

  def new_code
    ActiveSupport::SecureRandom.hex(6)
  end

  # Creates a random code for this user that can be used to reset the user
  # password through the reset and do_reset actions on the controller.
  def make_reset_code
    self.reset_code = new_code
    self.reset_code_at = Time.now.utc
  end


  # Sends an activation email to the user. This email contains a link that
  # allows the user to activate their account. See UserMailer::activation. This method
  # saves this User.
  
  def send_activation_email!
    # Preconditions checked by UserMailer.deliver_activation.
    transaction do
      UserMailer.activation(self).deliver
      self.activation_email_sent_at = Time.now
      self.save!
    end
  end

  # Sends a password reset email to the user. This email contains a link that
  # allows the user to reset the password. See UserMailer::forgot. This method
  # saves this User.
  def send_reset_password_email!
    if self.active? || self.pending?
      transaction do
        make_reset_code
        save!
        UserMailer.forgot(self).deliver
      end
    end
  end

  # Sends a welcome email to the user. This email contains a link that
  # allows the user to reset the password. See UserMailer::forgot. This method
  # saves this User.
  def send_welcome_email!
    if self.active? || self.pending?
      transaction do
        make_reset_code
        save!
        UserMailer.welcome(self).deliver
      end
    end
  end

  # login can be either username or email address
  def self.authenticate(login, pass)
    user = self.where(["username=? OR email=?", login, login]).first
    return user if user && user.matching_password?(pass) && user.active?
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
