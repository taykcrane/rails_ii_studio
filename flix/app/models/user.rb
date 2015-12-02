class User < ActiveRecord::Base
  has_secure_password

  validates :name, presence: true
  validates :username, presence: true, format: /\A[a-zA-Z0-9]+\z/i, uniqueness: {case_sensitive: false}
  validates :email, presence: true, format: /\A\S+@\S+\z/, uniqueness: {case_sensitive: false}
  validates :password, length: {minimum: 4, allow_blank: true}

  def gravatar_id
  	Digest::MD5::hexdigest(email.downcase)
  end

  def self.authenticate(email, password)
  	user = User.find_by(email: email)
  	user && user.authenticate(password)
  end
end
