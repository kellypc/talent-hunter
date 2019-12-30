require 'rails_helper'

feature 'Candidate view proposal' do
  scenario 'sucessfully' do
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Junior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)

    job_application = JobApplication.create!(job: job, candidate: candidate,
                                             created_at: 29/12/2019 )

    job_application = JobProposal.create!(company_name: "Empresa Teste",
      init_date: "02/01/2020", salary: "10.000", benefits: "Vale transporte",
      headhunter_id: headhunter.id, job_application_id: job_application.id)

    login_as(candidate, scope: :candidate)
    visit root_path

    click_link 'Admin'
    click_link 'Minhas Propostas'

    expect(page).to have_content('Veja as propostas que você se recebeu')
    expect(page).to have_content(job.title)
  end
end
