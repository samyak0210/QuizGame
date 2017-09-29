require 'test_helper'

class BollywoodsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @bollywood = bollywoods(:one)
  end

  test "should get index" do
    get bollywoods_url
    assert_response :success
  end

  test "should get new" do
    get new_bollywood_url
    assert_response :success
  end

  test "should create bollywood" do
    assert_difference('Bollywood.count') do
      post bollywoods_url, params: { bollywood: { MultiChoice: @bollywood.MultiChoice, correctans: @bollywood.correctans, o1: @bollywood.o1, o2: @bollywood.o2, o3: @bollywood.o3, o4: @bollywood.o4, question: @bollywood.question } }
    end

    assert_redirected_to bollywood_url(Bollywood.last)
  end

  test "should show bollywood" do
    get bollywood_url(@bollywood)
    assert_response :success
  end

  test "should get edit" do
    get edit_bollywood_url(@bollywood)
    assert_response :success
  end

  test "should update bollywood" do
    patch bollywood_url(@bollywood), params: { bollywood: { MultiChoice: @bollywood.MultiChoice, correctans: @bollywood.correctans, o1: @bollywood.o1, o2: @bollywood.o2, o3: @bollywood.o3, o4: @bollywood.o4, question: @bollywood.question } }
    assert_redirected_to bollywood_url(@bollywood)
  end

  test "should destroy bollywood" do
    assert_difference('Bollywood.count', -1) do
      delete bollywood_url(@bollywood)
    end

    assert_redirected_to bollywoods_url
  end
end
