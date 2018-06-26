# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  account         :string
#  username        :string
#  password_digest :string
#  api_token       :string
#  email           :string
#  is_admin        :boolean          default(FALSE), not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  accommodations  :string
#
require 'membership'

class User < ApplicationRecord
    has_many :visits
    belongs_to :membership, foreign_key: :account
    has_one_attached :image
    
    has_secure_password
    has_secure_token :api_token
    validates :username, :password_digest, :email, :account, presence: true
    validates_uniqueness_of :username
    validate :users_limit_per_account

    def users_limit_per_account
        @member = Membership.find_by(account: user_params.account)
        @user = User.find_by(account: :account)
        if @user
            @user2 = User.find_by(account: :account).where(:id != @user.id)
        end
        if @member.num_allowed == 2 && @user2
            errors.add(:account, "2 users already exist for this membership account")
        elsif @member.num_allowed == 1 && @user
            errors.add(:account, "A user already exists for this membership account")
        end

    end

    def to_s
        username
    end
end
