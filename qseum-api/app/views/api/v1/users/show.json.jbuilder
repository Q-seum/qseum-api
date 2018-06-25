json.data do
    json.id @user.id
    json.attributes do
        json.accountNumber @user.account
        json.username @user.username
        json.email @user.email
        json.apiToken @user.api_token
        json.accommodations @user.accommodations
    end
end