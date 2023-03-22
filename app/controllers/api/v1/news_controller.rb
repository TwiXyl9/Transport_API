class Api::V1::NewsController < ApplicationController
  before_action :set_news, only: %i[ show update destroy]
  def index
    @news_all = News.all

    render json: @news_all
  end

  def show
    render json: @news
  end

  def create
    @news = News.create(news_params)
    if @news.save
      render json: @news, status: :created
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  def update
    if @news.update(news_params)
      render json: @news
    else
      render json: @news.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @news.destroy
  end

  private
  def set_news
    @news = News.find(params[:id])
  end

  def news_params
    params.require(:news).permit(:title,:description)
  end
end
