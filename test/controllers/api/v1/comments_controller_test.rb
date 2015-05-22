require 'test_helper'

class Api::V1::CommentsControllerTest < ActionController::TestCase
  def setup
    @comment = {
        user_id: 1,
        opinion_id: 1,
        description: 'Não é da sua contas'
    }
  end
  test "show" do
    get :show, {controller: 'api/v1/comments', id: 1, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response, 'Não buscou o comentário'
  end

  test "create" do
    @comment[:description] = ""
    post :create, {controller: 'api/v1/comments', comment: @comment, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response['description']

    @comment[:description] = 'Não é da sua contas'
    post :create, {controller: 'api/v1/comments', comment: @comment, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    assert_not_nil response['id']
  end

  test "update" do
    @comment[:description] = "Agora outra descrição"
    put :update, {controller: 'api/v1/comments', comment: @comment, format: :json, id: 1}
    assert_response :success
    response = JSON.parse @response.body
    assert response['description'] == 'Agora outra descrição'
  end

  test "destroy" do
    post :create, {controller: 'api/v1/comments', comment: @comment, format: :json}
    assert_response :success
    response = JSON.parse @response.body
    id = response['id']

    delete :destroy, {controller: 'api/v1/comments', format: :json, id: id}
    assert_response :success
    response = JSON.parse @response.body
    assert response['id'] == id

    get :show, {controller: 'api/v1/comments', id: id, format: :json}
    response = JSON.parse @response.body
    assert response['error']
  end
end
