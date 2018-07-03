class TicketMailer < ApplicationMailer

    def send_ticket(ticket)
        @ticket = ticket
        @qr = RQRCode::QRCode.new("https://q-seum.firebaseapp.com/api/v1/tickets/#{@ticket.id}")
        mail to: @ticket.recip_email, subject: "Q-seum Admission Ticket"
    end 
end
