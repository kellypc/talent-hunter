require 'rails_helper'
feature 'Headhunter create job' do
  scenario 'successfully' do
    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    login_as(headhunter, scope: :headhunter)

    visit root_path
    click_link 'Admin'
    click_on 'Vagas'
    click_link 'Cadastrar vaga'

    fill_in 'Título da vaga', with: 'Desenvolvedor full stack'
    fill_in 'Descrição', with: 'Descrição para teste'
    fill_in 'Habilidades Desejadas', with: 'Habilidades para teste'
    fill_in 'Salário', with: 4.000
    fill_in 'Data limite', with: '23/01/2020'
    fill_in 'Local de trabalho', with: 'Remoto'
    choose 'junior'

    click_button 'Salvar'

    expect(page).to have_content('Sair')


  end
end
