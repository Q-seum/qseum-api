class Issue < ApplicationRecord
    belongs_to :user, foreign_key: :user_id

    validates :user_id, :text, presence: true

end
