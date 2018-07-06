json.issues_new do
    json.array! @issues_new do |issue|
        json.id issue.id 
        json.user_id issue.user_id
        json.username issue.user.username
        json.email issue.user.email
        json.phone issue.user.membership.phone   
        json.created_at issue.created_at
        json.text issue.text
        json.resolved issue.resolved
    end
end

json.issues_resolved do
    json.array! @issues_resolved do |issue|
        json.id issue.id 
        json.user_id issue.user_id
        json.username issue.user.username
        json.email issue.user.email
        json.phone issue.user.membership.phone   
        json.created_at issue.created_at
        json.text issue.text
        json.resolved issue.resolved
    end
end
