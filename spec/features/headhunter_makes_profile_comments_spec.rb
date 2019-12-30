require 'rails_helper'

feature 'Headhunter makes profile comments' do
  scenario 'sucessfully' do
    headhunter = Headhunter.create!(name: 'Kelly', email: 'test@test.com', password: '123456')
    job = Job.create!(title: 'Desenvolvedora', description: 'testando',
                      skills: 'testando', salary: 3.000, job_level: 'Júnior',
                      start_date: '23/01/2012', end_date: '23/02/2020',
                      local_job: 'Remoto', headhunter: headhunter)
    candidate = Candidate.create!(name: 'Kelly', email: 'kelly@teste.com',
                                  password: '123456')

    profile = Profile.create(full_name: candidate.name ,social_name: "Kelly Cruz",
                            title: "Desenvolvedor Full-Stack",
                            address: "Rua Teste, 001", phone_number: "(11) 98272-2911",
                            birth_date: "26/07/1990", academic_formation: "Superior Completo",
                            description: "Algo legal aqui", skills: "Ruby, Rails",
                            candidate_id: candidate.id, experience: "Campus Code - 2019", status: "completed")

    job_application = JobApplication.create!(job: job,candidate: candidate,
                                             created_at: 29/12/2019 )

    login_as(headhunter, scope: :headhunter)
    visit root_path
    click_on 'Admin'
    find('[name=view-job]').click
    click_on 'Ver candidatos'
    find('[name=view-profile]').click

    fill_in 'comment[body]', with: 'Obrigado por se aplicar para a vaga'
    click_on 'Adicionar comentário'

    expect(page).to have_content('Perfil do Candidato')
    expect(page).to have_content('Obrigado por se aplicar para a vaga')
  end
end
