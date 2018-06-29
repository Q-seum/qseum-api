json.array! @issues do |issue|
    json.id issue.id 
    json.user_id issue.user_id
    json.username issue.user.username
    json.username issue.user.email
    json.phone issue.user.membership.phone   
    json.created_at issue.created_at
    json.text issue.text
end