json.data do
    json.id @visit.id
    json.attributes do
        json.accountNumber @visit.visit_date
        json.username @visit.user
    end
end