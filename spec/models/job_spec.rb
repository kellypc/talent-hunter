require 'rails_helper'

RSpec.describe Job, type: :model do
  describe '.end_date_must_be_greater_than_start_date' do
    it 'sucess' do
      headhunter = Headhunter.create!(name: 'Kelly', email: 'teste@teste.com',
                                      password: '123456')
      job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                        skills: 'testando', salary: 3.000, job_level: 'Júnior',
                        start_date: '23/01/2012', end_date: '23/02/2020',
                        local_job: 'Remoto', headhunter: headhunter)

      job.valid?

      expect(job.errors).to be_empty
    end
  end
end
