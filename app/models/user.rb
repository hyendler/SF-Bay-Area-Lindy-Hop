class User < ActiveRecord::Base
  validates :email, :first_name, :last_name, presence: true

  validate :unique_email, :password

  def password
    if hashed_password
      @password ||= BCrypt::Password.new(hashed_password)
    else
      errors.add(:password, "can't be left blank")
    end
  end

  def password=(new_password)
    unless new_password.empty?
      @password = BCrypt::Password.create(new_password)
      self.hashed_password = @password
    end
  end

  def unique_email
    if User.find_by(email: email)
      errors.add(:email, "has already been taken")
    end
  end

  def self.authenticate(email, password)
    if user = User.find_by(email: email)
      user if (user.password == password)
    end
  end
end
