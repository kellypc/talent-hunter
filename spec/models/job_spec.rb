require 'rails_helper'

RSpec.describe Job, type: :model do
  describe '.end_date_must_be_greater_than_start_date' do
    it 'sucess' do
      headhunter = Headhunter.create!(name: 'Kelly', email: 'teste@teste.com',
                                      password: '123456')
      job = Job.create!(title: 'Desenvolvedora', description: 'testando o sistema',
                        skills: 'Ruby, CSS, HTML', salary: 3.000, job_level: 'Júnior',
                        start_date: 1.day.from_now, end_date: 2.day.from_now,
                        local_job: 'Remoto', headhunter: headhunter)

      job.valid?

      expect(job.errors).to be_empty
    end

    it 'end date less than start date' do
      headhunter = Headhunter.create!(name: 'Kelly', email: 'teste@teste.com',
                                      password: '123456')
      job = Job.new(title: 'Desenvolvedora', description: 'testando o sistema',
                        skills: 'Ruby, CSS, HTML', salary: 3.000, job_level: 'Júnior',
                        start_date: 2.day.from_now, end_date: 1.day.from_now,
                        local_job: 'Remoto', headhunter: headhunter)

      job.valid?

      expect(job.errors.full_messages).to include(
        'End date deve ser maior que data inicial'
      )
    end
  end
end
