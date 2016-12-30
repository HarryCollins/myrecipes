class ReviewsController < ApplicationController


  def create
    @recipe = Recipe.find(params[:id])
    review = Review.new(header: params[:review][:header], body: params[:review][:body], rating: params[:review][:rating], chef: current_user, recipe: @recipe)

    if review.valid?
      review.save 
      flash[:success] = "You successfully left a review"
    else
      flash[:danger] = review.errors.full_messages.each do |error|
        error
      end
    end

    redirect_to :back
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(header: params[:review][:header], body: params[:review][:body], rating: params[:review][:rating], chef: current_user, recipe: @review.recipe)
      flash[:success] = "Your review was updated succesfully!"
    else
      flash[:danger] = @review.errors.full_messages.each do |error|
        error
      end
    end
    redirect_to :back
  end

  def destroy
    Review.find(params[:id]).destroy
    flash[:success] = "Review Deleted"
    redirect_to :back
  end

end