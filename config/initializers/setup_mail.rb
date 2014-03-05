ActionMailer::Base.smtp_settings = {  
  :address              => "smtp.sendgrid.net",  
  :port                 => 587,  
  :domain               => "www.accentrealtyus.com",  
  :user_name            => "btharris781",  
  :password             => "foraccentrealty",  
  :authentication       => "plain",  
  :enable_starttls_auto => true  
}  
