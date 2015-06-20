class Api::V1::DisagreesController < ApplicationController
    before_action :set_disagree, only: [:show, :update, :destroy]

    def index
        @disagrees = Disagree.all
        respond_to do |format|
            format.json { render :json => @disagrees ? @disagrees : record_not_found }
        end
    end

    def create
        @disagree = Disagree.new disagree_params
        respond_to do |format|
            if @disagree.save
                format.json { render :json => @disagree.to_json }
            else
                format.json { render :json => @disagree.errors.to_json }
            end
        end
    end

    def show
        respond_to do |format|
          format.json { render :json => @disagree ? @disagree : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @disagree.update disagree_params
                format.json { render :json => @disagree.to_json }
            else
                format.json { render :json => @disagree.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @disagree
                @disagree.destroy
                format.json { render :json => @disagree.to_json }
            else
                format.json { render :json => record_not_found }
            end
        end
    end

    private
    def disagree_params
        if(!params[:disagree])
            disagree_hash = JSON.parse(request.raw_post)
            disagree = disagree_hash['disagree']
            {user_id: disagree['user_id'], opinion_id: disagree['opinion_id']}
        else
            params.require(:disagree).permit(:user_id, :opinion_id)
        end
    end

    def set_disagree
        @disagree = Disagree.find_by_id(params[:id])
    end
end
