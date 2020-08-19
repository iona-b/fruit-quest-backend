class User < ApplicationRecord
    has_many :scores
    has_many :levels, through: :scores

    has_secure_password
end
