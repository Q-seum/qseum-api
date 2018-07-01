# == Schema Information
#
# Table name: password_resets
#
#  id         :bigint(8)        not null, primary key
#  user_id    :integer
#  email      :string
#  new_token  :string
#  used       :boolean          default(FALSE), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class PasswordReset < ApplicationRecord
    belongs_to :user, foreign_key: :user_id
    
    
    has_secure_token :new_token

    def create_reset_digest
        self.reset_token = User.new_token
        update_attribute(:reset_digest, User.digest(reset_token))
    end

end
