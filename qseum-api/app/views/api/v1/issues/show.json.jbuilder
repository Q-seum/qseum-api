json.data do
    json.id @issue.id
    json.attributes do
        json.created @issue.created_at.in_time_zone
        json.updated @issue.update_at.in_time_zone
        json.text @issue.text
        json.user @issue.user
    end
end