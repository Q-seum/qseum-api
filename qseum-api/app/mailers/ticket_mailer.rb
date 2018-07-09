require 'rqrcode'
require 'chunky_png'
require 'rqrcode_png'
require 'tempfile'

class TicketMailer < ApplicationMailer

    def send_ticket(ticket)
        @ticket = ticket
        @qr = RQRCode::QRCode.new("https://q-seum.firebaseapp.com/tickets/#{@ticket.id}").to_img.resize(150,150)
        file = Tempfile.new('qrcode')
        file.close
        @qr.save(file.path)
        @qr = @qr.to_data_url
        attachments.inline['YourMuseumTicket.png'] = File.read(file.path)
        attachments['YourMuseumTicket.png'] = File.read(file.path)
        file.unlink
        if @ticket.recip_email
            mail to: @ticket.recip_email, subject: "Q-seum Admission Ticket"
        else
            mail to: @ticket.buyer_email, subject: "Q-seum Admission Ticket"
        end
    end 
end
