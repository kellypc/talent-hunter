require 'rails_helper'

feature 'Candidate apply to job' do
  scenario 'successfully' do
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'ruby', salary: 3.000, job_level: 0,
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)

    login_as(candidate, scope: :candidate)

    visit root_path

    click_on 'Mais detalhes'

    click_on 'Candidate-se'

    expect(page).to have_content('Você se candidatou com sucesso')
  end

  scenario 'application failed' do
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'ruby', salary: 3.000, job_level: 0,
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)
    job_application = JobApplication.create!(job: job, candidate: candidate,
                                             created_at: 29/12/2019 )

    login_as(candidate, scope: :candidate)

    visit root_path

    click_on 'Mais detalhes'

    expect(page).to have_content('Você já se candidatou a essa vaga')
  end
end
