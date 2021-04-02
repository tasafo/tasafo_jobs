class ApplicationMailer < ActionMailer::Base
  default from: "Trampos <nao-responda@#{ENV['HOST_URL']}>"
  layout 'mailer'
end
