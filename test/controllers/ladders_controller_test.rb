require 'test_helper'

class LaddersControllerTest < ActionController::TestCase
  setup do
    @ladder = ladders(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:ladders)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create ladder" do
    assert_difference('Ladder.count') do
      post :create, ladder: { ladder: @ladder.ladder, player: @ladder.player, result: @ladder.result, status: @ladder.status }
    end

    assert_redirected_to ladder_path(assigns(:ladder))
  end

  test "should show ladder" do
    get :show, id: @ladder
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @ladder
    assert_response :success
  end

  test "should update ladder" do
    patch :update, id: @ladder, ladder: { ladder: @ladder.ladder, player: @ladder.player, result: @ladder.result, status: @ladder.status }
    assert_redirected_to ladder_path(assigns(:ladder))
  end

  test "should destroy ladder" do
    assert_difference('Ladder.count', -1) do
      delete :destroy, id: @ladder
    end

    assert_redirected_to ladders_path
  end
end
