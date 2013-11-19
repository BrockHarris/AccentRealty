class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string    :email
      t.string    :username
      t.string    :password_hash
      t.string    :password_salt
      t.string    :firstname
      t.string    :lastname
      t.boolean   :upadtes_news, :default=>true
      t.boolean   :updates_blog_posts, :default=>false
      t.datetime  :deleted_at
      t.string 		:state
      t.string    :mode
      t.string    :activation_code, :limit=>100
      t.datetime  :activated_at
      t.datetime  :activation_email_sent_at
      t.string    :reset_code, :limit=>50
      t.datetime  :reset_code_at
      t.datetime  :deleted_at
      t.timestamps
    end
  end
end
