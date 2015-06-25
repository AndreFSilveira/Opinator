require 'will_paginate/array'
class Api::V1::OpinionsController < ApplicationController
    before_action :set_opinion, only: [:show, :update, :destroy]

    def index
        if params[:user_id]
            filter_opinions_with_id
        else
            all_opinions
        end

        respond_to do |format|
            format.json {render :json => @opinions ? @opinions : record_not_found }
        end
    end

    def all_opinions
        @opinions = Array.new
        opinions = Opinion.all.order(id: :desc)
        opinions.each do |each_opinion|
            opinion = each_opinion.attributes
            opinion['likes'] = Agree.where(opinion_id: each_opinion.id).size
            opinion['unlikes'] = Disagree.where(opinion_id: each_opinion.id).size
            @opinions.push(opinion)
        end
    end

    def filter_opinions_with_id
        @user = User.find(params[:user_id])

        if(@user)
            opinions = Opinion.all.order(id: :desc)
            @opinions = Array.new
            opinions.each do |each_opinion|
                user = each_opinion.user
                opinion = Hash.new
                opinion['likes'] = Agree.where(opinion_id: each_opinion.id).size
                opinion['unlikes'] = Disagree.where(opinion_id: each_opinion.id).size
                opinion['is_like'] = Agree.find_by(opinion_id: each_opinion.id, user_id: @user.id) ? true : false
                opinion['is_unlike'] = Disagree.find_by(opinion_id: each_opinion.id, user_id: @user.id) ? true : false
                opinion['user'] = user.attributes
                each_opinion.attributes.each {|i,v| opinion[i] = v}
                @opinions.push opinion
            end
            @opinions = @opinions.paginate(:page => params[:page], :per_page => 9)
        else
            @opinions = []
        end
    end

    def count
        respond_to do |format|
         format.json { render :json => Opinion.count }
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
        if(!params[:opinion])
            opinion_hash = JSON.parse(request.raw_post)
            opinion = opinion_hash['opinion']
            {description: opinion['description'], user_id: opinion['user_id'], approved: opinion['approved'] ? opinion['approved'] : false, title: opinion['title']}
        else
            params.require(:opinion).permit(:description, :user_id, :approved, :title)
        end
    end

    def set_opinion
        @opinion = Opinion.find_by_id(params[:id])
    end
end
