json.data do
    json.id @issue.user_id
    json.attributes do
        json.created @issue.created_at
        json.updated @issue.update_at
        json.text @issue.text
    end
end