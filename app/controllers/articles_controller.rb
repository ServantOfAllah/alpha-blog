class ArticlesController < ApplicationController
   
    def index
        @articles = Article.all #listing all articles
    end
    
    def new
        @article = Article.new      #creating an instance variable to communicate with form 
    end
    
    def create
        @article = Article.new(article_params)
        if @article.save
            flash[:success] = "Article was successfully created"
            redirect_to article_path(@article)
        else
            render 'new'
        end
    end
    
    def edit
        @article = Article.find(params[:id])
    end
    
    def update
        @article = Article.find(params[:id])
        if @article.update(article_params)
            flash[:success] = "Article was updated succesfully"
            redirect_to article_path(@article)
        else
            render 'edit'
        end
    end
    
    def show
        @article = Article.find(params[:id])
    end
    
    def destroy
        @article = Article.find(params[:id])
        @article.destroy
        flash[:danger] = "Article successfully deleted"
        redirect_to articles_path
    end
    
    private
    def article_params
        params.require(:article).permit(:title, :description)
    end
    
end