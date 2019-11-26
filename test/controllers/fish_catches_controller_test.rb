require 'test_helper'

class FishCatchesControllerTest < ActionDispatch::IntegrationTest
  test "should set defaults" do
    get fish_catches_url
    assert_reponse :success
  end
end
