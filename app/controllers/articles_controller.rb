class ArticlesController < ApplicationController

  before_action :set_params, only: [:show, :edit, :update, :destroy]

  def new
    @article = Article.new
  end

  def index
    @articles = Article.all
  end

  def create
    @article = Article.new(article_params)
    @article.save
    redirect_to article_path(@article)
  end

  def edit
  end

  def update
    @article.update(article_params)
    redirect_to article_path(@article)
  end

  def show
  end

  def destroy
    @article.destroy
    redirect_to article_path, status: :see_other
  end

  private

  def set_params
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :content)
  end
end
