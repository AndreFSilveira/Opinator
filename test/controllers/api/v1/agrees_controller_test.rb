require 'test_helper'

class Api::V1::AgreesControllerTest < ActionController::TestCase
  def setup
    @agree = {
      user_id: 1,
      opinion_id: 1,
    }
  end

  test "create" do
    post :create, controller: 'api/v1/agrees', agree: @agree, format: :json
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response, 'Não salvou o agree'
  end
end
