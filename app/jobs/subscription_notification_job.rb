class SubscriptionNotificationJob < ApplicationJob
  queue_as :default

  def perform(new_subscription)
    EventMailer.subscription(new_subscription).deliver_later
  end
end
