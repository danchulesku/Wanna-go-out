# config/initializers/recaptcha.rb
Recaptcha.configure do |config|
  config.site_key  = Rails.application.credentials.recaptcha[:site_key]
  config.secret_key = Rails.application.credentials.recaptcha[:secret_key]

  # Uncomment the following line if you are using a proxy server:
  # config.proxy = 'http://myproxy.com.au:8080'

  # Uncomment the following lines if you are using the Enterprise API:
  #config.enterprise = Rails.application.credentials.recaptcha[:RECAPTCHA_ENTERPRISE]
  #config.enterprise_api_key = Rails.application.credentials.recaptcha[:RECAPTCHA_ENTERPRISE_API_KEY]
  #config.enterprise_project_id = Rails.application.credentials.recaptcha[:RECAPTCHA_ENTERPRISE_PROJECT_ID]
end
