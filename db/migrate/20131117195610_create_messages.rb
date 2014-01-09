class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string  :name
      t.string  :email
      t.string  :subject
      t.text    :body
      t.boolean :read, :default=>false
      t.timestamps
    end
  end
end
