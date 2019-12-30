class Candidate < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :name, :email, presence: true

  has_one :profile
  has_many :job_applications
  has_many :job_proposals, through: :job_applications

  def can_apply_to_job?(job_id)
    self.job_applications.where(job_id: job_id).blank?
  end
end
