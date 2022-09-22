class CommentNotificationJob < ApplicationJob
  queue_as :default

  def perform(comment)
    # Собираем всех подписчиков и автора события в массив мэйлов, исключаем повторяющиеся
    all_emails = (comment.event.subscriptions.map(&:user_email) + [comment.event.user.email]).uniq - [comment.user&.email]
    # По адресам из этого массива делаем рассылку
    # Как и в подписках, берём EventMailer и его метод comment с параметрами
    # И отсылаем в том же потоке
    all_emails.each do |email|
      EventMailer.comment(comment, email).deliver_later
    end
  end
end
