class User < ApplicationRecord
  attr_accessor :remember_token

  has_many :fishing_trips, dependent: :destroy
  has_many :fish_catches, dependent: :destroy
  has_attached_file :profile_image, styles: {
    small: 'x80',
    medium: 'x100',
    square_md: '100x100#'
  }, default_url: "/images/:style/smile-emoji.png"
  
  validates_attachment_content_type :profile_image, content_type: /\Aimage/

  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, 
                   length: { maximum: 255},
                   format: { with: VALID_EMAIL_REGEX },
                   uniqueness: { case_sensitive: false }
  has_secure_password  
  validates :password, length: { minimum: 6 }, 
                       presence: true,
                       if: :password_digest_changed?
  
  def top_fish
    FishCatch.find_top_fish(:weight, 10, nil, self.id)
  end
  
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
                                                  
    BCrypt::Password.create(string, cost: cost)
  end
  
  def self.new_token
    SecureRandom.urlsafe_base64
  end
  
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end
  
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
end
