class Profile < ApplicationRecord
  belongs_to :candidate

  has_one_attached :avatar

  has_many :comments

  validates :full_name, presence: { message: 'Não pode ficar em branco'}
  validates :social_name, presence: { message: 'Não pode ficar em branco'}
  validates :title, presence: { message: 'Não pode ficar em branco'}
  validates :address, presence: { message: 'Não pode ficar em branco'}
  validates :phone_number, presence: { message: 'Não pode ficar em branco'}
  validates :birth_date, presence: { message: 'Não pode ficar em branco'}
  validates :academic_formation, presence: { message: 'Não pode ficar em branco'}
  validates :description, presence: { message: 'Não pode ficar em branco'}
  validates :skills, presence: { message: 'Não pode ficar em branco'}
  validates :experience, presence: { message: 'Não pode ficar em branco'}
  
  enum status: { pending: 0, completed: 1 }
end
