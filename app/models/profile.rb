class Profile < ApplicationRecord
  belongs_to :candidate

  has_one_attached:avatar

  enum status: { pending: 0, completed: 1 }
end
