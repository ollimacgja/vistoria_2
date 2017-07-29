ActionMailer::Base.smtp_settings = {
  :address => "mail.portochibatao.com.br",
  :port                 => 26,
  :user_name => "grc01@portochibatao.com.br", #Your SMTP user
  :password => "pc@#2015", #Your SMTP password
  :authentication       => "plain",
  :enable_starttls_auto => true,
  :openssl_verify_mode => 'none' 
}