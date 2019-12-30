class JobProposal < ApplicationRecord
  belongs_to :job_application
  belongs_to :headhunter

  enum statuses: { pendente: 0, aceito: 5, rejeitado: 10 }
end
