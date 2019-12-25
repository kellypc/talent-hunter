class CreateJobApplications < ActiveRecord::Migration[5.2]
  def change
    create_table :job_applications do |t|
      t.integer :status, default: 0

      t.references :job, foreign_key: true
      t.references :candidate, foreign_key: true

      t.timestamps
    end
  end
end
