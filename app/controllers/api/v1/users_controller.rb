class Api::V1::UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy, :logged]

    def index
        @users = User.all
        respond_to do |format|
          format.json { render :json => @users ? @users : record_not_found }
        end
    end

    def logged
        respond_to do |format|
            format.json { render :json => @user ? @user.logged : record_not_found }
        end
    end

    def find_by_uid
        @user = User.find_by(uid: params[:uid])
        respond_to do |format|
            format.json { render :json => @user ? @user : record_not_found }
        end
    end

    def create
        @user = User.new user_params
        respond_to do |format|
            if @user.save
                format.json { render :json => @user.to_json }
            else
                format.json { render :json => @user.errors.to_json }
            end
        end
    end

    def show
        respond_to do |format|
          format.json { render :json => @user ? @user : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @user.update user_params
                format.json { render :json => @user.to_json }
            else
                format.json { render :json => @user.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @user
                @user.destroy
                format.json { render :json => @user.to_json }
            else
                format.json { render :json => record_not_found }
            end
        end
    end

    private
    def user_params
        if(!params[:user])
            user_hash = JSON.parse(request.raw_post)
            user = user_hash['user']
            {name: user['name'], uid: user['uid'], logged: user['logged']}
        else
            params.require(:user).permit(:name, :uid, :logged)
        end
    end

    def set_user
        @user = User.find_by_id(params[:id])
    end
end
