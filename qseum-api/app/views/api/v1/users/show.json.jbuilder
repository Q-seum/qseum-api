json.links do
    json.self api_v1_user_path(@user)
    json.newVisit do
        json.method "POST"
        json.href api_v1_visits_path
    end
end

json.data do
    json.id @user.id
    json.attributes do
        json.accountNumber @user.account
        json.username @user.username
        json.email @user.email
        json.apiToken @user.api_token
        json.isAdmin @user.is_admin
        json.accommodations @user.accommodations
        json.membershipType @user.membership.membership_type
        json.joinDate @user.membership.join_date
        json.expirationDate (@user.membership.join_date + 1.year)
        json.visits @user.visits
        json.selfie @user.selfie
        json.validSelfie @user.valid_selfie
    end
end