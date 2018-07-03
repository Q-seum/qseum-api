class TicketMailer < ApplicationMailer

    def send_ticket(ticket)
        @ticket = ticket
        mail to: @ticket.recip_email, subject: "Q-seum Admission Ticket"
    end 
end
