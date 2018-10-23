class ReviewsController < ApplicationController
    def index
       @reviews =  Review.all
    end
    
    def show
       @review = Review.find(params[:id])
    end
    
    def new
        @review = Review.new
    end
    
    def create
        @review = Review.new(reviews_params)
        
        if @review.save 
            redirect_to @review 
        else render 'new'
        end
    end
    
    def edit
       @review = Review.find(params[:id]) 
    end
    
    def update 
       @review = Review.find(params[:id])
       
       if @review.update(reviews_params)
           redirect_to @review
        else
            render 'edit'
        end
    end
    
    def destroy
       @review = Review.find(params[:id])
       @review.destroy
       
       redirect_to reviews_path
    end
end

private
    def reviews_params
        params.require(:review).permit(:title, :text)
    end