class Api::V1::CommentsController < ApplicationController
    before_action :set_comment, only: [:show, :update, :destroy]

    def index
        @comments = Comment.all
        respond_to do |format|
            format.json { render :json => @comments ? @comments : record_not_found }
        end
    end

    def create
        @comment = Comment.new comment_params
        respond_to do |format|
            if @comment.save
                format.json { render :json => success_hash }
            else
                format.json { render :json => @comment.errors.to_json }
            end
        end
    end

    def show
        respond_to do |format|
          format.json { render :json => @comment ? @comment : record_not_found }
        end
    end

    def update
        respond_to do |format|
            if @comment.update comment_params
                format.json { render :json => success_hash }
            else
                format.json { render :json => @comment.errors.to_json }
            end
        end
    end

    def destroy
        respond_to do |format|
            if @comment
                @comment.destroy
                format.json { render :json => @comment.to_json }
            else
                format.json { render :json => record_not_found }
            end
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:user_id, :opinion_id, :description)
    end

    def set_comment
        @comment = Comment.find_by_id(params[:id])
    end
end
