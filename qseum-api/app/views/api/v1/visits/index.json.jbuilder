json.array! @visits do |visit|
    json.id visit.id
    json.date visit.date
    json.primary visit.user.membership.primary_name
    json.secondary visit.user.membership.secondary_name
    json.email visit.user.email
    json.phone visit.user.membership.phone
    json.account visit.account
    json.membershipType visit.user.membership.membership_type
    json.visitors visit.visitors 
  end