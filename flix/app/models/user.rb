class User < ActiveRecord::Base
  has_secure_password
  has_many :reviews, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_movies, through: :favorites, source: :movie

  validates :name, presence: true
  validates :username, presence: true, format: /\A[a-zA-Z0-9]+\z/i, uniqueness: {case_sensitive: false}
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 4, allow_blank: true}

  scope :by_name, -> {order(:name)}
  scope :not_admins, -> {by_name.where(admin: false)}

  def gravatar_id
  	Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password)
  end
end
