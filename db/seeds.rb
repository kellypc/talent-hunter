# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Comment.delete_all
JobProposal.delete_all
JobApplication.delete_all
Job.delete_all
Profile.delete_all
Headhunter.delete_all
Candidate.delete_all

headhunter = Headhunter.create!(
  name: "Tallent Hunter",
  email: "headhunter@tallent.com",
  password: "123456",
  password_confirmation: "123456"
)

candidate = Candidate.create!(
  name: "Candidate Tallent",
  email: "candidate@tallent.com",
  password: "123456",
  password_confirmation: "123456")

Profile.create!(full_name: candidate.name ,social_name: "Kelly Cruz",
                        title: "Desenvolvedor Full-Stack",
                        address: "Rua Teste, 001", phone_number: "(11) 98272-2911",
                        birth_date: "26/07/1990", academic_formation: "Superior Completo",
                        description: "Algo legal aqui", skills: "Ruby, Rails",
                        candidate_id: candidate.id, experience: "Campus Code - 2019", status: "completed")

10.times.each do |index|
  Job.create!(
    title: "Vaga #{index + 1}",
    description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur feugiat eros eget dui eleifend scelerisque. Sed quis mauris vitae augue scelerisque suscipit vel non enim. Praesent luctus neque nec semper finibus. Cras feugiat nulla consectetur tortor dignissim aliquam. Curabitur id nulla velit. Nunc fermentum justo metus, sed maximus ligula bibendum eu. Morbi accumsan magna eu nisi placerat, a tempor sapien lobortis. ",
    skills: "Ruby, Rails, Heroku, CSS, Javascript",
    salary: 1000 * (index + 1),
    job_level: Job.job_levels.values.sample,
    start_date: Date.today,
    end_date: Date.today + 30.days,
    local_job: "Av Paulista, 312 - São Paulo - SP",
    status: :ativo,
    headhunter_id: headhunter.id)
end
