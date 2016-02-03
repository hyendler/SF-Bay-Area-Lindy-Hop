class User < ActiveRecord::Base

  validates :username, presence: true
  validates :username, uniqueness: true
  validate :password

  include BCrypt

  def password
    if password_hash
      @password ||= Password.new(password_hash)
    else
      errors.add(:password, "must be at least 3 characters long.")
    end
  end

  def password=(new_password)
    if new_password.length >= 3
      @password = Password.create(new_password)
      self.password_hash = @password
    end
  end

  def self.authenticate(username, password)
    if user = User.find_by(username: username)
      return user if user.password == password
    end
  end
end
