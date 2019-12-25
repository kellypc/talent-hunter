require 'rails_helper'

feature 'Headhunter view candidates apply' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Júnior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)

    login_as(headhunter, scope: :headhunter)

    visit root_path
    click_link 'Admin'
    find('[name=view-job]').click
    click_link 'Ver candidatos'

    expect(page).to have_content('Candidatos para a vaga: ')

  end
end
