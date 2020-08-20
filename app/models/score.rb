class Score < ApplicationRecord
  belongs_to :user
  belongs_to :level

  validates :level, uniqueness: {scope: :user}
end
