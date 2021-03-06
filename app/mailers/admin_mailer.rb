class AdminMailer < ApplicationMailer

  def update_mailer(current_admin, admin)
    @current_admin = current_admin
    @admin = admin
    mail(to: @admin.email,
         subject: "Seus dados foram alterados"
        )
  end

  def send_message(current_admin, recipient, subject, message)
    @current_admin = current_admin
    @recipient = recipient
    @subject = subject
    @message = message
    mail(from:current_admin.email , to: @recipient, subject: @subject)
  end
end
