require 'rqrcode'

class TicketMailer < ApplicationMailer

    def send_ticket(ticket)
        @ticket = ticket
        @qr = RQRCode::QRCode.new("https://q-seum.firebaseapp.com/api/v1/tickets/#{@ticket.id}")
        attachments['QR Code'] = File.read("/Users/jacob/Momentum/qseum-api/qseum-api/app/views/ticket_mailer/send_ticket.html.erb")

        if @ticket.recip_email
            mail to: @ticket.recip_email, subject: "Q-seum Admission Ticket"
        else
            mail to: @ticket.buyer_email, subject: "Q-seum Admission Ticket"
        end
    end 
end
