require 'rails_helper'
feature 'Headhunter edit job' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Júnior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)

    login_as(headhunter, scope: :headhunter)

    visit root_path
    click_link 'Admin'
    click_on 'Vagas'

    find('[name=edit-job]').click

    fill_in 'Título da vaga', with: 'Desenvolvedor full stack'

    click_button 'Salvar'

    expect(page).to have_content('Sair')


  end
end
