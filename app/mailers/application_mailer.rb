class ApplicationMailer < ActionMailer::Base
  default from: "from@example.com"
  default charset: '7bit'
  layout "mailer"
end
