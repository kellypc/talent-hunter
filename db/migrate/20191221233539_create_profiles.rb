class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.string :full_name
      t.string :social_name
      t.string :title
      t.string :address
      t.integer :phone_number
      t.date :bith_date
      t.string :academic_formation
      t.text :description
      t.string :skills
      t.text :experience
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
