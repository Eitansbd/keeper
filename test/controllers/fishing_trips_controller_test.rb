require 'test_helper'

class FishingTripsControllerTest < ActionDispatch::IntegrationTest
  def setup
    @fishing_trip = fishing_trips(:trip_1)
  end
  
  test "should redirect create when not logged in" do 
    assert_no_difference 'FishingTrip.count' do
      post fishing_trips_path, params: { fishing_trip: { content: "Test Trip" } }
    end
    
    assert_redirected_to login_url
  end
  
  test "should redirect destroy when not logged in" do 
    assert_no_difference 'FishingTrip.count' do
      delete fishing_trip_path(@fishing_trip)
    end
    assert_redirected_to  login_url
  end
end
