require 'rqrcode'
require 'chunky_png'
require 'rqrcode_png'

class TicketMailer < ApplicationMailer

    def send_ticket(ticket)
        @ticket = ticket
        @qr = RQRCode::QRCode.new("https://q-seum.firebaseapp.com/api/v1/tickets/#{@ticket.id}").to_img.resize(200,200).to_data_url
        # attachments['QRCode'] = File.read()

        if @ticket.recip_email
            mail to: @ticket.recip_email, subject: "Q-seum Admission Ticket"
        else
            mail to: @ticket.buyer_email, subject: "Q-seum Admission Ticket"
        end
    end 
end
