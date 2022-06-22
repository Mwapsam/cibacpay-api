class User < ApplicationRecord
  require 'securerandom'
  has_one :merchants

  has_secure_password
  PASSWORD_REQUIREMENTS = /\A(?=.{8,})(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?!.*\s).*\z/

  validates :email, presence: true, uniqueness: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true, format: PASSWORD_REQUIREMENTS, on: :create
end
