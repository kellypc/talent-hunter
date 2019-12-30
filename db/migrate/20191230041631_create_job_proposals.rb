class CreateJobProposals < ActiveRecord::Migration[5.2]
  def change
    create_table :job_proposals do |t|
      t.string :company_name, default: ""
      t.datetime :init_date
      t.float :salary
      t.text :benefits
      
      t.timestamps
    end
  end
end
