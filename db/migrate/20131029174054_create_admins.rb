class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
    	t.string    :email
    	t.string    :username
    	t.string    :password_hash
      t.string    :password_salt
      t.boolean   :owner, :default=>false
      t.string    :firstname
      t.string    :lastname
      t.timestamps
    end
  end
end
