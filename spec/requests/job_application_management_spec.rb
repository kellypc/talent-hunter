require 'rails_helper'

describe 'job_applications management' do
  context 'show' do
    it 'render job_application correctly' do
      candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                    password: '123456')

      headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

      job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                        skills: 'testando', salary: 3.000, job_level: 'Junior',
                        start_date: '23/01/2012', end_date: '23/02/2020',
                        local_job: 'Remoto', headhunter: headhunter)

      job_application = JobApplication.create!(job: job, candidate: candidate,
                                               created_at: 29/12/2019 )

      get api_v1_job_application_path(job_application)
      json = JSON.parse(response.body, symbolize_names: true)

      expect(response).to have_http_status(:ok)
      expect(json[:job_id]).to eq(job_application.job_id)
      expect(json[:candidate_id]).to eq(job_application.candidate_id)
    end

    it 'Job application not found' do
      get api_v1_job_application_path(id: 999)
      expect(response).to have_http_status(:not_found)
    end

    context 'index' do
      it 'render correctly' do
        candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                      password: '123456')

        headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

        job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                          skills: 'testando', salary: 3.000, job_level: 'Junior',
                          start_date: '23/01/2012', end_date: '23/02/2020',
                          local_job: 'Remoto', headhunter: headhunter)
         job_application1 = JobApplication.create!(job: job, candidate: candidate,
                                                  created_at: 29/12/2019 )
         job_application2 = JobApplication.create!(job: job, candidate: candidate,
                                                  created_at: 29/12/2019 )

         get api_v1_job_application_path(job_application1)
         json = JSON.parse(response.body, symbolize_names: true)
         expect(json.first[job_application1.job_id])
      end
    end

    context 'post' do
      it 'created correctly' do
        candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                      password: '123456')

        headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

        job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                          skills: 'testando', salary: 3.000, job_level: 'Junior',
                          start_date: '23/01/2012', end_date: '23/02/2020',
                          local_job: 'Remoto', headhunter: headhunter)

        post api_v1_job_applications_path, params: {
                                          job_application: {job_id: job.id, candidate_id: candidate.id,
                                          created_at: 29/12/2019
                                          }
                                        }
        json = JSON.parse(response.body, symbolize_names: true)

        expect(response).to have_http_status(:ok)
        expect(json[:job_id]).to eq(job.id)
        expect(json[:candidate_id]).to eq(candidate.id)
      end
    end
  end
end
