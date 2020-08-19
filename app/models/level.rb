class Level < ApplicationRecord
    has_many :scores
    has_many :users, through: :scores
end
