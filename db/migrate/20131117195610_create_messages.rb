class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
    	t.string  :name
      t.string  :email
      t.string  :subject
      t.text    :body
      t.boolean :read, :default=>false
      t.boolean :newsletter, :default=>false
      t.boolean :responded_to, :default=>false
      t.string  :response_subject
      t.text    :response_body
      t.timestamps
    end
  end
end
