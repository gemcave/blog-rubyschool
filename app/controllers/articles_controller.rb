class ArticlesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_article, only: [:show, :edit, :update, :destroy]


	def index
		@articles = Article.all
	end

	def new
	end
	
	def update
		if @article.update(article_params)
			redirect_to @article
		else
			render :edit
		end
	end

	def edit
	end
	
	def show
	end
	
  def create
    @article = Article.new(article_params)
    if @article.valid?
      @article.save
      redirect_to @article
    else
      render action: 'new'
    end
	end
	
	def destroy
		@article.destroy
	
		redirect_to articles_path
	end

	private
	def set_article
		@article = Article.find_by!(permalink: params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :text, :regenerate_permalink)
  end
end
