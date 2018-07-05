json.data do
    json.id @issue.id
    json.attributes do
        json.created @issue.created_at
        json.updated @issue.updated_at
        json.text @issue.text
        json.user @issue.user.username
        json.resolved @issue.resolved
    end
end