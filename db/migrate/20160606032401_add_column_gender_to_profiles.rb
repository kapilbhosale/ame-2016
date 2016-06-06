class AddColumnGenderToProfiles < ActiveRecord::Migration
  def change
    add_column :profiles, :gender, :integer, default: 0, null: false
  end
end
