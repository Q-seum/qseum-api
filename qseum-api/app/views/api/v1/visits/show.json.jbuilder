json.data do
    json.id @visit.id
    json.attributes do
        json.accountNumber @visit.date.in_time_zone
        json.username @visit.user
    end
end