require 'test_helper'

class FishingTripTest < ActiveSupport::TestCase
  def setup
    @user = users(:david)
    @fishing_trip = @user.fishing_trips.new(content: "Great Day on the Water")
  end
  
  test "should be valid" do
    assert @fishing_trip.valid?
  end

  test "user id should be present" do
    @fishing_trip.user_id = nil
    assert_not @fishing_trip.valid?
  end

  test "content should be present" do
    @fishing_trip.content = "   "
    assert_not @fishing_trip.valid?
  end
end
