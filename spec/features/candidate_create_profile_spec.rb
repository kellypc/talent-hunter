require 'rails_helper'

feature 'Candidate create profile' do
  scenario 'succesfully' do
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')
    login_as(candidate, scope: :candidate)
    visit root_path

    click_on 'Criar perfil'

    expect(page).to have_content('Preencha seu perfil para que possamos te conhecer')

    fill_in 'Nome completo', with: 'Kelly Teste'
    fill_in 'Nome social', with: 'Kelly Cruz'
    fill_in 'Título', with: 'Desenvolvedor Full-stack'
    fill_in 'Formação acadêmica', with: 'Análise e Desenvolvimento de Sistemas'
    fill_in 'Endereço', with: 'Rua Teste, São Paulo - SP'
    fill_in 'Número de telefone', with: '(11) 9277-9866'
    fill_in 'Data de nascimento', with: '26/07/1985'
    fill_in 'Habilidades', with: 'Ruby, Rails'
    fill_in 'Descrição', with: 'Testando'
    fill_in 'Experiência', with: 'Testando'

    click_on 'Salvar'

    expect(page).to have_content('Kelly Teste')
    expect(page).to have_content('Perfil criado com sucesso')
  end
end
