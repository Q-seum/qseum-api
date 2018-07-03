# Preview all emails at http://localhost:3000/rails/mailers/ticket_mailer
class TicketMailerPreview < ActionMailer::Preview

  def send_ticket
    TicketMailer.send_ticket(Ticket.last)
  end
end
