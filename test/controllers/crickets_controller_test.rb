require 'test_helper'

class CricketsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @cricket = crickets(:one)
  end

  test "should get index" do
    get crickets_url
    assert_response :success
  end

  test "should get new" do
    get new_cricket_url
    assert_response :success
  end

  test "should create cricket" do
    assert_difference('Cricket.count') do
      post crickets_url, params: { cricket: { correctans: @cricket.correctans, o1: @cricket.o1, o2: @cricket.o2, o3: @cricket.o3, o4: @cricket.o4, question: @cricket.question } }
    end

    assert_redirected_to cricket_url(Cricket.last)
  end

  test "should show cricket" do
    get cricket_url(@cricket)
    assert_response :success
  end

  test "should get edit" do
    get edit_cricket_url(@cricket)
    assert_response :success
  end

  test "should update cricket" do
    patch cricket_url(@cricket), params: { cricket: { correctans: @cricket.correctans, o1: @cricket.o1, o2: @cricket.o2, o3: @cricket.o3, o4: @cricket.o4, question: @cricket.question } }
    assert_redirected_to cricket_url(@cricket)
  end

  test "should destroy cricket" do
    assert_difference('Cricket.count', -1) do
      delete cricket_url(@cricket)
    end

    assert_redirected_to crickets_url
  end
end
