require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  test "show" do
    get :show, {controller: 'api/v1/users', id: 1, format: :json}
    assert_response :success
    response = JSON.parse @response.body
  end


end
