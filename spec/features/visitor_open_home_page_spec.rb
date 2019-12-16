require 'rails_helper'

feature 'Visitor open home page' do
  scenario 'successfully' do
    visit root_path

    expect(page).to have_content('Bem-vindo ao Talent Hunter')
    expect(page).to have_content('Encontre o emprego dos seus sonhos')
  end
end
