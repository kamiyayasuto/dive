# Use this hook to configure devise mailer, warden hooks and so forth.
# Many of these configuration options can be set straight in your model.
Devise.setup do |config|

  config.secret_key = '2b7cc14c0378a2c13d98813f3abf0543d27f62ec03f2f3c67a2d548aff783e669a1ca3898b2d6b561ef9afdbe4672adff7e5721927e2963b7e8b59ddbed896d9'
  config.mailer_sender = 'noreply@yourdomain'
  require 'devise/orm/active_record'
  config.case_insensitive_keys = [:email]
  config.strip_whitespace_keys = [:email]
  config.skip_session_storage = [:http_auth]
  config.stretches = Rails.env.test? ? 1 : 11
  config.reconfirmable = true
  config.expire_all_remember_me_on_sign_out = true
  config.password_length = 6..128
  config.email_regexp = /\A[^@\s]+@[^@\s]+\z/
  config.reset_password_within = 6.hours
  config.sign_out_via = :delete

  if Rails.env.production?
    config.omniauth :facebook, ENV["FACEBOOK_ID_PRODUCTION"],
                               ENV["FACEBOOK_SECRET_PRODUCTION"],
                               scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :twitter,  ENV["TWITTER_ID_PRODUCTION"],
                               ENV["TWITTER_SECRET_PRODUCTION"],
                               scope: 'email', display: 'popup', info_fields: 'name, email'
  else
    config.omniauth :facebook, ENV["FACEBOOK_ID_DEVELOPMENT"],
                               ENV["FACEBOOK_SECRET_DEVELOPMENT"],
                               scope: 'email', display: 'popup', info_fields: 'name, email'
    config.omniauth :twitter,  ENV["TWITTER_ID_DEVELOPMENT"],
                               ENV["TWITTER_SECRET_DEVELOPMENT"],
                               scope: 'email', display: 'popup', info_fields: 'name, email'
  end


end
