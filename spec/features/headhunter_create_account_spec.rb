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

    expect(page).to have_link('Sair')
  end

  scenario 'and must fill in all fields' do
    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    visit root_path
    click_on 'Cadastre-se como headhunter'

    fill_in 'Nome', with: ''
    fill_in 'Email', with: 'kelly@test.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmação de Senha', with: '12345678'

    click_button 'Cadastrar'
  end

  scenario 'and name must be unique' do
    headhunter = Headhunter.create!(name: 'Teste', email: 'test@test.com', password: '123456')

    visit root_path
    click_on 'Cadastre-se como headhunter'

    fill_in 'Nome', with: 'Teste'
    fill_in 'Email', with: 'kelly@test.com'
    fill_in 'Senha', with: '12345678'
    fill_in 'Confirmação de Senha', with: '12345678'

    click_button 'Cadastrar'

    expect(page).to have_content('Nome já está em uso')
  end
end
