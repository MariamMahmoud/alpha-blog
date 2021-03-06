class ArticlesController < ApplicationController

    def show
        @article = Article.find(params[:id])
    end

    def index
        @articles = Article.all
    end

    def new
        @article = Article.new()
    end

    def edit
        @article = Article.find(params[:id])
    end

    def update
        @article = Article.find(params[:id])
        if @article.update(params.require(:article).permit(:title, :description))
            flash[:notice] = "Article was updated!!"
            # redirect_to article_path(@article)
            redirect_to @article
        else
            render :edit
        end

    end

    def create
        @article = Article.new(params.require(:article).permit(:title, :description))
        if @article.save
            flash[:notice] = "Article was saved!!"
            redirect_to @article
        else
            render 'new'
        end
    end

    def destroy
        @article = Article.find(params[:id])
        if @article.destroy
            flash[:notice] = "Article was Destroyed!!"
            redirect_to @article
        else
            render 'index'
        end
    end
end