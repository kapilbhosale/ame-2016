class AddColumnCreateByToStudent < ActiveRecord::Migration
  def change
    add_column :users, :created_by, :integer, default: -1
  end
end
