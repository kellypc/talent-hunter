class JobProposal < ApplicationRecord
  belongs_to :job_application
  belongs_to :headhunter
end
