# frozen_string_literal: true

class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :tweets, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_one_attached :profile_picture


  before_save :email_to_downcase

  validates :name, presence: true, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 50 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  validates :password, length: { minimum: 6 }

  def likes?(tweet)
    tweet.likes.where(user_id: id).any?
  end

  private

  def email_to_downcase
    self.email = email.downcase
  end
end
