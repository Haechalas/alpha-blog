class ArticlesController < ApplicationController

    before_action :set_article, only: [:show, :edit , :update , :destroy] 
    

    def show
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new
    end

    def edit
    end

    

    def create
        @article = Article.new(article_params)
    if  @article.save
        flash[:notice] = "Article created successfully"
        redirect_to article_path(@article)
    else
        render 'new'
    end

    def update
    if  @article.update(article_params)
        flash[:notice] = "Article was successfully updated"
        redirect_to @article
    else
        render 'edit'
            end
        end
    end
    
    def destroy
        @article.destroy
        redirect_to @article
    end
        
    private 

    def set_article
        @article = Article.find(params[:id])
    end

    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end

