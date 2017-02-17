require 'test_helper'

class GuestshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @guestship = guestships(:one)
  end

  test "should get index" do
    get guestships_url
    assert_response :success
  end

  test "should get new" do
    get new_guestship_url
    assert_response :success
  end

  test "should create guestship" do
    assert_difference('Guestship.count') do
      post guestships_url, params: { guestship: { event_id: @guestship.event_id, user_id: @guestship.user_id } }
    end

    assert_redirected_to guestship_url(Guestship.last)
  end

  test "should show guestship" do
    get guestship_url(@guestship)
    assert_response :success
  end

  test "should get edit" do
    get edit_guestship_url(@guestship)
    assert_response :success
  end

  test "should update guestship" do
    patch guestship_url(@guestship), params: { guestship: { event_id: @guestship.event_id, user_id: @guestship.user_id } }
    assert_redirected_to guestship_url(@guestship)
  end

  test "should destroy guestship" do
    assert_difference('Guestship.count', -1) do
      delete guestship_url(@guestship)
    end

    assert_redirected_to guestships_url
  end
end
