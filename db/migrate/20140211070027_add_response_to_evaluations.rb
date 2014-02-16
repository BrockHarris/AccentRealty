class AddResponseToEvaluations < ActiveRecord::Migration
  def change
  	add_column :evaluations, :response_subject, :string
  	add_column :evaluations, :response_body, :text
  	add_column :evaluations, :admin_id, :integer
  end
end
