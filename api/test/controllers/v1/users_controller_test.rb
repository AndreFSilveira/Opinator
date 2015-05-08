require 'test_helper'

class V1::UsersControllerTest < ActionController::TestCase
    include Devise::TestHelpers
  test "new_user" do
    put 'create', {:controller => 'v1/users'}
    assert_response :success
    resp = JSON.parse response.body
    assert_not_nil resp
  end
end
