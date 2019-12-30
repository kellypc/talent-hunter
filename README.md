# Talent Hunter

O Talent Hunter é um projeto desenvolvido durante o curso TreinaDev ministrado pela Campus Code em 2019.

O sistema oferece uma infinidade de vagas de emprego para profissionais da área de TI. Aqui os candidatos poderão encontrar o emprego dos sonhos, se candidatar e receberem feedbacks caso sejam recusados para alguma vaga.

## Tabela de Conteúdo

* [Instalação](#installation)
* [Como funciona](#how-it-works)
	* [Headhunter cria uma conta](#headhunter-create-account)
	* [Headhunter cadastra uma vaga](#headhunter-register-job)
	* [Headhunter vê candidatos inscritos numa vaga](#headhunter-see-candidates-for-job)
	* [Headhunter escreve comentários em perfil do candidato](#headhunter-comments-candidates-profile)
	* [Headhunter destaca candidato](#headhunter-highlight-candidate)
	* [Headhunter recusa candidato](#headhunter-recuse-candidates-for-job)
	* [Headhunter envia proposta para candidato](#headhunter-send-proposal-for-candidate)
	* [Headhunter visualiza resposta do candidato](#headhunter-view-candidate-response)
	* [Headhunter encerra a vaga](#headhunter-ends-job)
* [Testes com RSpec](#testing-with-rspec)

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

## How It Works

### Headhunter cria uma conta
 Um headhunter pode criar sua conta no sistema informando: um e-mail e uma senha. Ao criar uma conta o headhunter passa a ter acesso a funcionalidades de cadastro e gestão das vagas criadas por ele.
Somente um headhunter cadastrado pode visualizar os candidatos disponíveis na plataforma.

### headhunter-register-job
Um headhunter, autenticado na plataforma, pode cadastrar uma nova posição/vaga de emprego. A vaga deve conter um título, uma descrição detalhada, uma descrição das habilidades desejadas, uma faixa salarial, o nível da vaga (estágio, júnior, pleno, sênior, especialista, diretor), uma data limite para inscrição de candidatos e a região da vaga (ex: Av Paulista ou Trabalho Remoto). Outros campos podem ser adicionados à vaga caso você julgue necessário.
Ao criar uma vaga, ela deve estar disponível na plataforma para todos os candidatos visualizarem.

### headhunter-see-candidates-for-job

Um headhunter autenticado na plataforma pode ver, para cada vaga cadastrada, todas as pessoas que se candidataram para essa vaga. Deve ser possível ver a lista de candidatos e acessar cada perfil individualmente. O perfil deve conter todas as informações preenchidas pela pessoa em seu cadastro.

### headhunter-comments-candidates-profile

Um headhunter autenticado pode escrever um ou mais comentários no perfil de uma pessoa. Cada comentário deve registrar o texto do comentário e a data e hora que foi escrito.
Todos comentários devem ser visíveis quando o headhunter acessar o perfil da pessoa.

### headhunter-highlight-candidate

Um headhunter autenticado pode marcar o perfil de uma pessoa como destaque para uma vaga.
Os perfis marcados como destaque devem ter alguma marcação (ex: uma etiqueta ou uma imagem de estrela) ao lado do nome do candidato, para facilitar a identificação.

### headhunter-recuse-candidates-for-job
Um headhunter autenticado pode recusar a participação de um candidato para uma vaga. Ao recusar a participação do candidato, deve ser fornecido um feedback para o candidato. O feedback será visualizado na plataforma do usuário.

### headhunter-send-proposal-for-candidate
Um headhunter autenticado pode enviar uma proposta para um candidato. A proposta deve conter: data prevista para início na empresa, salário oferecido, benefícios e outros dados da proposta (ex: as funções do cargo, as expectativas da empresa, bônus etc.).

### headhunter-view-candidate-response
Um headhunter autenticado pode visualizar o retorno/feedback dos candidatos para as propostas enviadas. Caso o candidato tenha aceito a proposta, o headhunter pode encerrar a vaga. Caso o candidato tenha rejeitado, o headhunter pode ler o feedback enviado pelo candidato.

### headhunter-view-candidate-response
Um headhunter autenticado pode encerrar uma vaga. Ao encerrar uma vaga ela não deve ser mais visualizada pelos candidatos que usam o sistema. Não devem surgir novas inscrições de candidatos, nem podem ser agendadas entrevistas.

## Testing with RSpec

O projeto foi construído com TDD (Test Driven Development). Para executar os testes, basta executar os testes com o RSpec.

1. Execute todos os  testes

	~~~ sh
	$ bundle exec rspec
	~~~

Para ver a porcentagem de cobertura dos testes, abra o arquivo `coverage/index.html` at your browser.
