class CreateCutOffs < ActiveRecord::Migration
  def change
    create_table :cut_offs do |t|
      t.string  :college_name, null: false
      t.integer :college_code, null: false
      t.string  :branch_name, null: false
      t.integer :branch_code, null: false
      t.string  :category_name, null: false
      t.integer :rank, null: false
      t.decimal :composite_score, precision: 17, scale: 2, null: false

      # t.timestamps null: false
    end
  end
end
# college_name,college_code,branch_name,branch_code,catagory_name,rank,composite_score