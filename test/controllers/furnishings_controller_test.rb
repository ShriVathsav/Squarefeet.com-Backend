require 'test_helper'

class FurnishingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @furnishing = furnishings(:one)
  end

  test "should get index" do
    get furnishings_url, as: :json
    assert_response :success
  end

  test "should create furnishing" do
    assert_difference('Furnishing.count') do
      post furnishings_url, params: { furnishing: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show furnishing" do
    get furnishing_url(@furnishing), as: :json
    assert_response :success
  end

  test "should update furnishing" do
    patch furnishing_url(@furnishing), params: { furnishing: {  } }, as: :json
    assert_response 200
  end

  test "should destroy furnishing" do
    assert_difference('Furnishing.count', -1) do
      delete furnishing_url(@furnishing), as: :json
    end

    assert_response 204
  end
end
