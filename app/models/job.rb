class Job < ApplicationRecord
  validates :title, :description, :skills, :salary, :job_level, presence: true
  validates :start_date, :local_job, presence: true

  belongs_to :headhunter

  has_many :job_applications
  
  enum job_levels: { estagiario: 0, junior: 5, pleno: 10, senior: 15, especialista: 20, diretor: 25 }

  enum status: { ativo: 0, inativo: 1 }

  validate :end_date_must_be_greater_than_start_date

  def end_date_must_be_greater_than_start_date
    return unless start_date.present? && end_date.present?

    if end_date <= start_date
      errors.add(:end_date, 'deve ser maior que data inicial')
    end
  end
end
