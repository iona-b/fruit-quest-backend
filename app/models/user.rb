class User < ApplicationRecord

    has_many :scores, dependent: :destroy
    has_many :levels, through: :scores

    has_secure_password
end
