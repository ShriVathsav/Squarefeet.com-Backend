require 'test_helper'

class AmenitiesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @amenity = amenities(:one)
  end

  test "should get index" do
    get amenities_url, as: :json
    assert_response :success
  end

  test "should create amenity" do
    assert_difference('Amenity.count') do
      post amenities_url, params: { amenity: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show amenity" do
    get amenity_url(@amenity), as: :json
    assert_response :success
  end

  test "should update amenity" do
    patch amenity_url(@amenity), params: { amenity: {  } }, as: :json
    assert_response 200
  end

  test "should destroy amenity" do
    assert_difference('Amenity.count', -1) do
      delete amenity_url(@amenity), as: :json
    end

    assert_response 204
  end
end
