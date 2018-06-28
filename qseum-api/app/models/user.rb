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
#  selfie          :string
#  valid_selfie    :boolean          default(FALSE), not null
#

require 'membership'

class User < ApplicationRecord
    has_many :visits, dependent: :destroy
    belongs_to :membership, foreign_key: :account
    # has_one_attached :image
    
    has_secure_password
    has_secure_token :api_token
    validates :username, :password_digest, :email, :account, :selfie, presence: true
    validates_uniqueness_of :username
    validate :users_limit_per_account

    def users_limit_per_account
        member = Membership.find_by(account: self.account)
        existing_user = User.where(:account => self.account).first
        if existing_user
            second_user = User.where(:account => self.account).where.not( :id => existing_user[:id]).first
        end
        if member.secondary_name && second_user
            self.errors.add(:account, "2 users already exist for this membership account")
        elsif !member.secondary_name && existing_user
            self.errors.add(:account, "A user already exists for this membership account")
        end
    end

    def to_s
        username
    end
end
