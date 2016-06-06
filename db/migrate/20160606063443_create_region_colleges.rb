class CreateRegionColleges < ActiveRecord::Migration
  def change
    create_table :region_colleges do |t|
      t.string :region_name
      t.integer :college_code
      t.timestamps null: false
    end
  end
end
