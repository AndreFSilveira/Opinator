require 'test_helper'

class Api::V1::UsersControllerTest < ActionController::TestCase
  test "show" do
    get :show, {controller: 'api/v1/users', id: 1, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response, 'Não buscou o usuário'
  end

  test "create" do
    user = {
        name: "Érico Dias",
        email: "e@ea.ca",
        password: "123123123"
    }
    post :create, {controller: 'api/v1/users', user: user, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response['id']
  end

  test "update" do
    user = {
        name: "Érico Dias",
        email: "e@ea.ca",
        password: "123123123"
    }
    put :update, {controller: 'api/v1/users', user: user, format: :json, id: 1}
    assert_response :success
    response = JSON.parse @response.body
    assert response['email'] == 'e@ea.ca'
  end

  test "destroy" do
    user = {
        name: "Érico Dias",
        email: "e@ea.ca",
        password: "123123123"
    }
    post :create, {controller: 'api/v1/users', user: user, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    id = response['id']

    delete :destroy, {controller: 'api/v1/users', format: :json, id: id}
    assert_response :success
    response = JSON.parse @response.body
    assert response['id'] == id

    get :show, {controller: 'api/v1/users', id: id, format: :json}
    response = JSON.parse @response.body
    assert response['error']
  end
end
