class V1::UsersController < ApplicationController
    respond_to :json
    def show
        respond_with(Array.new)
    end
end