class User < ApplicationRecord
    require "securerandom"

    has_secure_password

    validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
    validates :username, presence: true, uniqueness: true
end
