class CreateJobProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :job_proposals do |t|
      t.string :company_name, default: ""
      t.datetime :init_date
      t.float :salary
      t.text :benefits

      t.integer :status, default: 0

      t.belongs_to :headhunter
      t.belongs_to :job_application

      t.timestamps
    end
  end
end
