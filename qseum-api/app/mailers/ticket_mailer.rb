class TicketMailer < ApplicationMailer
    def send_ticket
        @user = params[:user]
        mail to: @user.email, subject: "Q-seum Admission Ticket"
    end 
end
