# == Schema Information
#
# Table name: issues
#
#  id         :bigint(8)        not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#  text       :text
#

class Issue < ApplicationRecord
    belongs_to :user, foreign_key: :user_id

    validates :user_id, :text, presence: true

end
