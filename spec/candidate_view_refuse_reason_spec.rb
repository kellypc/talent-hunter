require 'rails_helper'

feature 'Candidate view refuse reason' do
  scenario 'sucessfully' do
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com',
                                    password: '123456')

    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Junior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)

    job_application = JobApplication.create!(job: job, candidate: candidate,
                                             created_at: 29/12/2019 )
    login_as(candidate, scope: :candidate)
    visit root_path

    click_link 'Admin'
    find('[name=view-profile]').click

    expect(page).not_to have_content('Motivo da recusa')
  end

end
