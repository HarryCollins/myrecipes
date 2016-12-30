class RecipesController < ApplicationController

  def create
    @review = Review.new(review_params)
    @review.chef = current_user

    if @review.save
      flash[:success] = "Your recipe was created succesfully!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  private
  
    def review_params
  	  params.require(:review).permit(:header, :body, :rating, :recipe)
    end

end