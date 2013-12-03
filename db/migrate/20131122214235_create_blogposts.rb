class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
    	t.integer  :admin_id
      t.string  :title
      t.text    :body
      t.timestamps
    end
    add_index :blogposts, :admin_id
  end
end
