class CreateBlogposts < ActiveRecord::Migration
  def change
    create_table :blogposts do |t|
    	t.integer  :admin_id
      t.string   :title
      t.string   :category
      t.text     :heading
      t.text     :body
      t.datetime  :deleted_at
      t.timestamps
    end
    add_index :blogposts, :admin_id
    add_index :blogposts, :category
  end
end
