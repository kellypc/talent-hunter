require 'rails_helper'

feature 'Headhunter submits proposal to candidate' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')
    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Júnior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    job_application = JobApplication.create!(job: job,candidate: candidate,
                                             created_at: 2019-12-25 )

    login_as(headhunter, scope: :headhunter)

    visit root_path

    click_on 'Admin'
    find('[name=view-job]').click
    click_on 'Ver candidatos'
    find('[name=send-offer]').click

    expect(page).to have_content('Enviar proposta para o candidato')
  end
end
