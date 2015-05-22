require 'test_helper'

class Api::V1::DisagreesControllerTest < ActionController::TestCase
  def setup
    @disagree = {
        user_id: 1,
        opinion_id: 1
    }
  end
  test "show" do
    get :show, {controller: 'api/v1/disagrees', id: 1, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response['id'], 'Não buscou o disagree'
  end

  test "create" do
    @disagree[:user_id] = ""
    post :create, {controller: 'api/v1/disagrees', disagree: @disagree, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response['user']

    @disagree[:user_id] = 1
    post :create, {controller: 'api/v1/disagrees', disagree: @disagree, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response['id']
  end

  test "update" do
    @disagree[:opinion_id] = nil
    @disagree[:comment_id] = 1
    put :update, {controller: 'api/v1/disagrees', disagree: @disagree, format: :json, id: 1}
    assert_response :success
    response = JSON.parse @response.body
    assert response['opinion_id'] == nil
    assert response['comment_id'] == 1
  end

  test "destroy" do
    post :create, {controller: 'api/v1/disagrees', disagree: @disagree, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    id = response['id']

    delete :destroy, {controller: 'api/v1/disagrees', format: :json, id: id}
    assert_response :success
    response = JSON.parse @response.body
    assert response['id'] == id

    get :show, {controller: 'api/v1/disagrees', id: id, format: :json}
    response = JSON.parse @response.body
    assert response['error']
  end
end
