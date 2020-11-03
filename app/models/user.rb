class User < ApplicationRecord
  attr_accessor :remember_token

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  before_save{email.downcase!}
  validates :name, presence: true,
    length: {maximum: Settings.user.maximum_name}
  validates :email, presence: true,
    length: {maximum: Settings.user.maximum_email},
    format: {with: VALID_EMAIL_REGEX}, uniqueness: true
  has_secure_password
  validates :password, presence: true,
    length: {minimum: Settings.user.minimum_password}

  def self.digest string
    if cost = ActiveModel::SecurePassword.min_cost
      BCrypt::Engine::MIN_COST
    else
      BCrypt::Engine.cost
    end
    BCrypt::Password.create(string, cost: cost)
  end

  def self.new_token
    SecureRandom.urlsafe_base64
  end

  def remember
    self.remember_token = User.new_token
    update_column :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_column :remember_digest, nil
  end
end
