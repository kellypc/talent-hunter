class CreateJobs < ActiveRecord::Migration[5.2]
  def change
    create_table :jobs do |t|
      t.string :title
      t.text :description
      t.text :skills
      t.integer :salary
      t.integer :level_job
      t.date :start_date
      t.date :end_date
      t.string :local_job
      t.references :headhunter, foreign_key: true

      t.timestamps
    end
  end
end
