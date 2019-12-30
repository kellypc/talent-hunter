class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :candidate

  has_one :job_proposal

  enum statuses: { aprovado: 0, recusado: 1 }
end
