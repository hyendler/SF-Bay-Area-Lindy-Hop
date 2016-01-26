class Subscription < ActiveRecord::Base
  belongs_to :user
  belongs_to :channel

  def self.find_subscription(user_id, channel_id)
    Subscription.find_by(user_id: user_id, channel_id: channel_id)
  end
end
