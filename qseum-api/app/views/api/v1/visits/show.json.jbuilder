json.data do
    json.id @visit.id
    json.attributes do
        json.accountNumber @visit.date
        json.username @visit.user
    end
end