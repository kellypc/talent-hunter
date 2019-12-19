class Job < ApplicationRecord

  belongs_to :headhunter

  enum job_levels: { Estagiário: 0, Júnior: 5, Pleno: 10, Sênior: 15, Especialista: 20, Diretor: 25 }

  enum status: { ativo: 0, inativo: 1 }

  validate :end_date_must_be_greater_than_start_date

  def end_date_must_be_greater_than_start_date
    return unless start_date.present? && end_date.present?

    if end_date <= start_date
      errors.add(:end_date, 'deve ser maior que data inicial')
    end
  end
end
