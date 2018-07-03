# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview

     def send_ticket
    TicketMailer.with(user: User.last).send_ticket
  end
end
