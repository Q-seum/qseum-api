# == Schema Information
#
# Table name: memberships
#
#  id              :bigint(8)        not null, primary key
#  account         :string
#  primary_name    :string
#  secondary_name  :string
#  address         :string
#  phone           :string
#  email           :string
#  membership_type :integer
#  join_date       :date
#  expiration_date :date
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Membership < ApplicationRecord
    has_many :users, dependent: :destroy

end
