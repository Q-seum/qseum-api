# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  account    :string
#  visit_date :date
#  visitors   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Visit < ApplicationRecord
    belongs_to :user, foreign_key: :user_id

    validates :user_id, :account, :visit_date, :visitors, presence: true
end
