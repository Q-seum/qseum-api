class TicketMailer < ApplicationMailer

    def send_ticket(ticket)
        @ticket = ticket
        mail to: @ticket.buyer_email, subject: "Q-seum Admission Ticket"
    end 
end
