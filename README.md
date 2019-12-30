# Talent Hunter

O Talent Hunter é um projeto desenvolvido durante o curso TreinaDev ministrado pela Campus Code em 2019.

O sistema oferece uma infinidade de vagas de emprego para profissionais da área de TI. Aqui os candidatos poderão encontrar o emprego dos sonhos, se candidatar e receberem feedbacks caso sejam recusados para alguma vaga.

## Tabela de Conteúdo

* [Instalação](#instalacao)
* [Funcionalidades](#funcionalidades)
* [Testes com RSpec](#testes-com-rspec)

## Instalação

1. Clone the project.

	~~~ sh
	$ git@github.com:kellypc/talent-hunter.git
	~~~

2. Bundle the Gems.

	~~~ sh
	$ bundle install
	~~~
3. Start the application

	~~~ sh
	$ rails s
	~~~

## Funcionalidades

1. Headhunter cria uma conta
2. Headhunter cadastra uma vaga
3. Candidato cria uma conta
4. Candidato completa seu perfil
5. Candidato se inscreve em uma vaga
6. Headhunter vê todos inscritos em uma vaga
7. Headhunter escreve comentários no perfil do inscrito para uma vaga
8. Headhunter marca perfis como destaque
9. Headhunter rejeita perfil para vaga informando um feedback
10. Headhunter envia proposta para perfil
11. Candidato recebe feedback caso tenha sido recusado para vaga
12. Candidato recebe proposta enviada pelo headhunter
13. Candidato aceita/rejeita proposta
14. Headhunter recebe resposta do candidato
15. Headhunter encerra as inscrições para uma vaga

## Testes com RSpec

O projeto foi construído com TDD (Test Driven Development). Para executar os testes, basta executar os testes com o RSpec.

1. Execute todos os  testes

	~~~ sh
	$ bundle exec rspec
	~~~

Para ver a porcentagem de cobertura dos testes, abra o arquivo `coverage/index.html` at your browser.
