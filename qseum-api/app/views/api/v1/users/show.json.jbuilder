json.data do
    json.id @user.id
    json.attributes do
        json.accountNumber @user.account
        json.username @user.username
        json.email @user.email
        json.apiToken @user.api_token
        json.is_admin @user.is_admin
        json.accommodations @user.accommodations
        json.membership_type @user.membership.membership_type
        json.join_date @user.membership.join_date
        json.expiration_date (@user.membership.join_date + 1.year)
    end
end