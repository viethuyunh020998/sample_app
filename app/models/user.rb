class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save{email.downcase!}
  validates :name, presence: true, length: {maximum: Settings.user.maximum_name}
  validates :email, presence: true, length: {maximum: Settings.user.maximum_email},
    format: {with: VALID_EMAIL_REGEX}, unique: true
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.minimum_password}
end