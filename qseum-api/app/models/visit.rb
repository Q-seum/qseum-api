# == Schema Information
#
# Table name: visits
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  account    :string
#  visitors   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  date       :datetime
#

class Visit < ApplicationRecord
    belongs_to :user, foreign_key: :user_id
    scope :todays_visits, ->{ where("date > ?", Time.now.beginning_of_day).order('created_at DESC') }
    validates :user_id, :account, :date, :visitors, presence: true
end
