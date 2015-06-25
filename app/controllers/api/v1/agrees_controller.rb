class Api::V1::AgreesController < ApplicationController
    before_action :set_agree, only: [:show, :update, :destroy]

    def index
        @agrees = Agree.all
        respond_to do |format|
            format.json { render :json => @agrees ? @agrees : record_not_found }
        end
    end

    def create
        p request.raw_post.inspect
        @agree = Agree.new agree_params
        respond_to do |format|
            if @agree.save
                format.json { render :json => @agree.to_json }
            else
                format.json { render :json => @agree.errors.to_json }
            end
        end
    end

    def show
        respond_to do |format|
          format.json { render :json => @agree ? @agree : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @agree.update agree_params
                format.json { render :json => @agree.to_json }
            else
                format.json { render :json => @agree.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @agree
                @agree.destroy
                format.json { render :json => @agree.to_json }
            else
                format.json { render :json => record_not_found }
            end
        end
    end

    private
    def agree_params
        if(!params[:agree])
            agree_hash = JSON.parse(request.raw_post)
            agree = agree_hash['agree']
            {user_id: agree['user_id'], opinion_id: agree['opinion_id']}
        else
            params.require(:agree).permit(:user_id, :opinion_id)
        end
    end

    def set_agree
        @agree = Agree.find_by_id(params[:id])
    end
end
