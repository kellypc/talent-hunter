require 'rails_helper'

RSpec.describe JobApplication, type: :model do
  describe '.can_apply_to_job' do
    it 'must be false if the candidate has applied before' do
      candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                    password: '123456')

      headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

      job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                        skills: 'ruby', salary: 3.000, job_level: 0,
                        start_date: '23/01/2012', end_date: '23/02/2020',
                        local_job: 'Remoto', headhunter: headhunter)
      job_application = JobApplication.create!(job: job, candidate: candidate,
                                               created_at: 29/12/2019 )

      result = candidate.can_apply_to_job?(job)

      expect(result).to be false
    end
  end

end
