class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :profile
  belongs_to :headhunter
end
