# == Schema Information
#
# Table name: issues
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  text       :text
#  resolved   :boolean          default(FALSE), not null
#

class Issue < ApplicationRecord
    belongs_to :user, foreign_key: :user_id
    scope :weeks_issues, ->{ where("created_at > ?", Time.now.beginning_of_day - (60 * 60 * 24 * 7)).order('created_at DESC') }
    validates :user_id, :text, presence: true
end
