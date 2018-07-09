module MakeTicket
    extend ActiveSupport::Concern

    def new_ticket(charge)
        @ticket = Ticket.create(
            :charge_id => charge.id,
            :buyer_email => params[:email],
            :recip_email => params[:recip_email],
            :general => params[:general],
            :senior => params[:senior],
            :military => params[:military],
            :child => params[:child],
            :name => params[:name]
        )
    end

    def email_ticket(ticket)
        TicketMailer.send_ticket(ticket).deliver_later
    end

    

end