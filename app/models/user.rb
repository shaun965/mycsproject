class User
  include Mongoid::Document
  include Mongoid::Timestamps
  include ActiveModel::SecurePassword
  include Mongoid::Paperclip
  has_many :microposts, dependent: :destroy
	
  attr_accessor :remember_token
  
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  field :name,            type: String
  field :email,           type: String
  # field :created_at,       type: Time          
  # field :updated_at,       type: Time
  field :password_digest,  type: String
  field :remember_digest,  type: String

  has_secure_password
  field :admin,            type: Boolean, default: "false"
  #field :password,          type: String
  #field :password_confirmation,          type: String

  #############Paperclip#############

  has_mongoid_attached_file :avatar
  ###################################




  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end
  
  def feed
    #1Micropost.where("user_id = ?", id)
    microposts
    #3Micropost.find("user_id = ?", id)
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
  	return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
  	update_attribute(:remember_digest, nil)
  end

end
