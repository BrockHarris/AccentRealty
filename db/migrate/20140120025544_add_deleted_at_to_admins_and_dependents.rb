class AddDeletedAtToAdminsAndDependents < ActiveRecord::Migration
  def change
    add_column :admins, :deleted_at, :datetime
    add_column :blogposts, :deleted_at, :datetime
  end
end
