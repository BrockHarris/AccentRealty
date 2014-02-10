class AddResponseAndReadToMessagesAndQuestions < ActiveRecord::Migration
  def change
  	add_column :messages, :response_subject, :string
  	add_column :messages, :response_body, :text
  	add_column :messages, :responded_to, :boolean, :default => false
  end
end
