class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :channels, through: :subscriptions

  validates :email, presence: true, uniqueness: true
  validates :first_name, :last_name, presence: true

  validate :password

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

  def self.authenticate(email, password)
    user = User.find_by(email: email)
    return user if user && user.password == password
  end

  def total_subscriptions
    self.channels.reduce(0) {|sum, channel| sum + channel.price_per_month.to_f }
  end
end
