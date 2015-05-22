class Api::V1::OpinionsController < ApplicationController
    before_action :set_opinion, only: [:show, :update, :destroy]

    def index
        @opinions = Opinion.all
        respond_to do |format|
            format.json {render :json => @opinions ? @opinions : record_not_found }
        end
    end

    def create
        @opinion = Opinion.new opinion_params
        respond_to do |format|
            if @opinion.save
                format.json { render :json => success_hash }
            else
                format.json { render :json => @opinion.errors.to_json }
            end
        end
    end

    def show
        respond_to do |format|
          format.json { render :json => @opinion ? @opinion : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @opinion.update user_params
                format.json { render :json => success_hash }
            else
                format.json { render :json => @opinion.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @opinion
                @opinion.destroy
                format.json { render :json => @comment.to_json }
            else
                format.json { render :json => record_not_found }
            end
        end
    end

    private
    def opinion_params
        params.require(:opinion).permit(:description, :user_id)
    end

    def set_opinion
        @opinion = Opinion.find_by_id(params[:id])
    end
end
