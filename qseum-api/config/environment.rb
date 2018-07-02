# Load the Rails application.
require_relative 'application'
Rails.application.configure do
    config.time_zone = "Eastern Time (US & Canada)"
    # config.active_record.default_timezone = :local
end

ActionMailer::Base.smtp_settings = {
    :user_name => ENV['sendgrid_username'],
    :password => ENV['sendgrid_password'],
    :domain => 'herokuapp.com',
    :address => 'smtp.sendgrid.net',
    :port => 587,
    :authentication => :plain,
    :enable_starttls_auto => true
  }


# Initialize the Rails application.
Rails.application.initialize!
