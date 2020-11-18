require 'test_helper'

class OtherRoomsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @other_room = other_rooms(:one)
  end

  test "should get index" do
    get other_rooms_url, as: :json
    assert_response :success
  end

  test "should create other_room" do
    assert_difference('OtherRoom.count') do
      post other_rooms_url, params: { other_room: {  } }, as: :json
    end

    assert_response 201
  end

  test "should show other_room" do
    get other_room_url(@other_room), as: :json
    assert_response :success
  end

  test "should update other_room" do
    patch other_room_url(@other_room), params: { other_room: {  } }, as: :json
    assert_response 200
  end

  test "should destroy other_room" do
    assert_difference('OtherRoom.count', -1) do
      delete other_room_url(@other_room), as: :json
    end

    assert_response 204
  end
end
