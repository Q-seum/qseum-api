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
    # validate :users_limit_per_account


    def to_s
        username
    end
end
