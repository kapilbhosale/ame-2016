class AddColumnTypeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :type, :string, null: false, default: 'Student'
  end
end
