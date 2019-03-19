class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def top

  end

  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(article_params)
    if @article.save
      redirect_to articles_path,notice:"つぶやきが保存されました！"
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @article.update(article_params)
      redirect_to articles_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path, notice: "つぶやきを削除しました！"
  end

  def confirm
    @article = Article.new(article_params)
    render :new if @article.invalid?
  end


  private

  def article_params
    params.require(:article).permit(:content)
  end

  def set_article
    @article = Article.find(params[:id])
  end

end
