class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string  :first_name, null: false
      t.string  :father_name
      t.string  :surname, null: false
      t.string  :mother_name, null: false
      t.datetime  :date_of_birth, null: false
      t.integer :rank, null: false
      t.decimal :composite_score, null: false
      t.string  :category, null: false
      t.string  :home_university
      t.string  :contact_no
      t.string  :father_contact_no
      t.string  :email
      t.text    :address

      t.string  :cet_exam_number
      t.timestamps null: false
    end
  end
end


# first_name, father_name, surname, mother_name,
# date_of_birth,
# rank
# composite_score
# category
# home_university

# contact_no
# father_contact_no
# address
# email
