class ApplicationJob < ActiveJob::Base
  # Automatically retry jobs that encountered a deadlock
  # retry_on ActiveRecord::Deadlocked

  # Most jobs are safe to ignore if the underlying records are no longer available
  # discard_on ActiveJob::DeserializationError

  # Собираем всех подписчиков и автора события в массив мэйлов, исключаем повторяющиеся
  def notification_emails(record)
    event = record.event
    (event&.subscriptions&.map(&:user_email) + [event.user.email]).uniq - [record.user&.email]
  end
end
