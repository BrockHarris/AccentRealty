class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
    	t.text     :content
    	t.text     :response
    	t.string	 :category
    	t.boolean  :published, :default=>false
    	t.boolean  :responded_to, :default=>false
      t.timestamps
    end
    add_index :questions, :category
  end
end