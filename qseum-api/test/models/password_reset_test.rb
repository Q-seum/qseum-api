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

require 'test_helper'

class PasswordResetTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
