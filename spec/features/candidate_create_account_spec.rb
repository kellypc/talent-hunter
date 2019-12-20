require 'rails_helper'

feature 'Candidate create account' do
  scenario 'successfully' do

    visit root_path
    click_on 'Cadastre-se como profissional'

    fill_in 'Nome', with: 'Kelly Cruz'
    fill_in 'Email', with: 'kelly@test.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmação de Senha', with: '12345678'

    click_button 'Salvar'

    expect(page).to have_link('Sair')
    expect(page).not_to have_button('Admin')
  end
end
