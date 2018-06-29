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
#  reset_digest    :string
#

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
