class ArticlesController < ApplicationController
	def index
		@articles = Article.all
    end

	def show
		@article = Article.find(params[:id])
	end

	def new
		@article = Article.new
		# 因为不管是首次访问还是后来再渲染，html中都有@article.error这样的语句，所以@article至少需要一个初始值。
		# 从这里也就看出了render ‘new’ 相当于在本次@article的结果下再渲染一次。
	end

	def edit
  		@article = Article.find(params[:id])
	end

	def create
		@article = Article.new(article_params)

		if @article.save
			redirect_to @article
		else
			render 'new'
		end
	end

	def update
  		@article = Article.find(params[:id])
 
  		if @article.update(article_params)
    		redirect_to @article
  		else
    		render 'edit'
  		end
	end

	private
		def article_params
			params.require(:article).permit(:title, :text)
		end

end
