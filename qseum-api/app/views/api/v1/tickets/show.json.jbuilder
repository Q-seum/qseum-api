json.data do
    json.genTickets @ticket.general
    json.senTickets @ticket.senior
    json.milTickets @ticket.military
    json.childTickets @ticket.child
    json.redeem_status @ticket.redeemed
    json.recip_email @ticket.recip_email
    json.created @ticket.created_at
end