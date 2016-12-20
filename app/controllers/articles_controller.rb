class ArticlesController < ApplicationController
   
    def new
        @article = Article.new      #creating an instance variable to communicate with form 
    end
    def create
        @article = Article.new(article_params)
        @article.save
    end
    
    private
    def article_params
        params.require(:article).permit(:article, :description)
    end
    
end