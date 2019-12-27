require 'rails_helper'

feature 'Candidate search job' do
  scenario 'successfully' do
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')


    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Junior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)

    job_1 = Job.create!(title: 'Desenvolvedora fullstack', description: 'testando',
                      skills: 'testando', salary: 6.000, job_level: 'Senior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)


    login_as(candidate, scope: :candidate)
    visit root_path

    expect(page).to have_button('Buscar vagas')
    expect(page).to have_content(job.title)
    expect(page).to have_content(job_1.title)

  end
end
