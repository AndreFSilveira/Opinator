class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:get, :update, :destroy]

    def index
        @users = User.search(params[:search]).order('created_at DESC')
    end

    def create
        @user = User.new user_params
        respond_to do |format|
            if @user.save
                format.json { render :json => success_hash }
            else
                format.json { render :json => @user.errors.to_json }
            end
        end
    end

    def get
        respond_to do |format|
          format.json { render :json => @user ? @user.to_json : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @user.update user_params
                format.json { render :json => success_hash }
            else
                format.json { render :json => @user.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @user
                @user.destroy
                format.json { render :json => success_hash }
            else
                format.json { render :json => {error: 'Record not found'} }
            end
        end
    end

    private
    def user_params
        params.require(:user).permit(:name, :email, :password)
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end
