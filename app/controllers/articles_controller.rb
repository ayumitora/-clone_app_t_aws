class ArticlesController < ApplicationController
  def index
  end

  def new
    @article = Article.new
  end

  def create
    Article.create(article_params)
    redirect_to new_article_path
  end

  private

  def article_params
    params.require(:article).permit(:content)
  end

end
