# == Schema Information
#
# Table name: tickets
#
#  id          :bigint(8)        not null, primary key
#  recip_email :string
#  buyer_email :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  redeemed    :boolean          default(FALSE), not null
#  general     :integer
#  senior      :integer
#  military    :integer
#  child       :integer
#  name        :string
#

require 'test_helper'

class TicketTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
