class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
    	t.string  :title
      t.integer :admin_id
      t.text    :body
      t.timestamps
    end
  end
end
