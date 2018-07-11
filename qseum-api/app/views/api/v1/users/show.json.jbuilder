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
        json.accountNumber @user.membership.account
        json.username @user.username
        json.email @user.email
        json.apiToken @user.api_token
        json.isAdmin @user.is_admin
        json.accommodations @user.accommodations
        json.membershipType @user.membership.membership_type
        json.joinDate @user.membership.join_date
        json.expirationDate (@user.membership.join_date + 1.year)
        json.primaryUser @user.membership.primary_name
        json.secondaryUser @user.membership.secondary_name
        json.visits @user.visits do |visit|
            json.id visit.id 
            json.primary visit.user.membership.primary_name
            json.secondary visit.user.membership.secondary_name
            json.email visit.user.email
            json.phone visit.user.membership.phone
            json.account visit.account
            json.membershipType visit.user.membership.membership_type
            json.visitors visit.visitors 
            json.date visit.date
        end
        json.selfie @user.selfie
        json.validSelfie @user.valid_selfie
    end
end