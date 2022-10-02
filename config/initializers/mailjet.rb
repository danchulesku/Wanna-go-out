Mailjet.configure do |config|
  config.api_key = Rails.application.credentials.mailjet[:api_key]
  config.secret_key = Rails.application.credentials.mailjet[:secret_key]
  config.default_from = Rails.application.credentials.mailjet[:sender_email]

  config.api_version = 'v3.1'
end
