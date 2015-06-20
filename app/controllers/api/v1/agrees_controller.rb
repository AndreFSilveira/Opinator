class Api::V1::AgreesController < ApplicationController
    before_action :set_agree, only: [:show, :update, :destroy]

    def set_access_control_headers
        headers['Access-Control-Allow-Origin'] = '*'
    end

    def index
        @agrees = Agree.all
        respond_to do |format|
            format.json { render :json => @agrees ? @agrees : record_not_found }
        end
    end

    def create
        @Agree = Agree.new agree_params
        respond_to do |format|
            if @Agree.save
                format.json { render :json => @Agree.to_json }
            else
                format.json { render :json => @Agree.errors.to_json }
            end
        end
    end

    def show
        respond_to do |format|
          format.json { render :json => @Agree ? @Agree : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @Agree.update agree_params
                format.json { render :json => @Agree.to_json }
            else
                format.json { render :json => @Agree.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @Agree
                @Agree.destroy
                format.json { render :json => @Agree.to_json }
            else
                format.json { render :json => record_not_found }
            end
        end
    end

    private
    def agree_params
        params.require(:agree).permit(:user_id, :opinion_id)
    end

    def set_agree
        @Agree = Agree.find_by_id(params[:id])
    end
end
