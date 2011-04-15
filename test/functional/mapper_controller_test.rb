require 'test_helper'

class MapperControllerTest < ActionController::TestCase
  test "should get station" do
    get :station
    assert_response :success
  end

  test "should get find_closest_stations" do
    get :find_closest_stations
    assert_response :success
  end

  test "should get station_schedule" do
    get :station_schedule
    assert_response :success
  end

  test "should get index" do
    get :index
    assert_response :success
  end

end
