require 'rails_helper'

feature 'Headhunter create account' do
  scenario 'successfully' do
    visit root_path

    click_on 'Cadastre-se como headhunter'

    fill_in 'Nome', with: 'Kelly Cruz'
    fill_in 'Email', with: 'kelly@test.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmação de Senha', with: '12345678'

    click_button 'Cadastrar'

    save_and_open_page

    expect(page).to have_link('Sair')
  end
end
