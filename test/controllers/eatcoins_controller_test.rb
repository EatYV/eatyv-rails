require 'test_helper'

class EatcoinsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @eatcoin = eatcoins(:one)
  end

  test "should get index" do
    get eatcoins_url
    assert_response :success
  end

  test "should get new" do
    get new_eatcoin_url
    assert_response :success
  end

  test "should create eatcoin" do
    assert_difference('Eatcoin.count') do
      post eatcoins_url, params: { eatcoin: { amount: @eatcoin.amount } }
    end

    assert_redirected_to eatcoin_url(Eatcoin.last)
  end

  test "should show eatcoin" do
    get eatcoin_url(@eatcoin)
    assert_response :success
  end

  test "should get edit" do
    get edit_eatcoin_url(@eatcoin)
    assert_response :success
  end

  test "should update eatcoin" do
    patch eatcoin_url(@eatcoin), params: { eatcoin: { amount: @eatcoin.amount } }
    assert_redirected_to eatcoin_url(@eatcoin)
  end

  test "should destroy eatcoin" do
    assert_difference('Eatcoin.count', -1) do
      delete eatcoin_url(@eatcoin)
    end

    assert_redirected_to eatcoins_url
  end
end
