class JobApplication < ApplicationRecord
  belongs_to :job
  belongs_to :candidate

  enum statuses: { aprovado: 0, recusado: 1 }
end
