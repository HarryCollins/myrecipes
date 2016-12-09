class RecipesController < ApplicationController

  def index
    @recipes = Recipe.paginate(page: params[:page], per_page: 4)
  end

  def show
  	##can use the pry gem below - good debug tool for finding params being passed in
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.chef = Chef.find(current_user)

    if @recipe.save
      flash[:success] = "Your recipe was created succesfully!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])

    if @recipe.update(recipe_params)
      flash[:success] = "Your recipe was updated succesfully!"
      redirect_to recipe_path(@recipe)
    else
      render :edit
    end

  end

  def like
    @recipe = Recipe.find(params[:id])
    like = Like.new(like: params[:like], chef: Chef.find(current_user), recipe: @recipe)

    if like.valid?
      like.save
      params[:like] == "true" ? opinion = "liked" : opinion = "disliked"  
      flash[:success] = "You successfully #{opinion} this recipe"
    else
      flash[:danger] = "You may only vote once"
    end

    redirect_to :back
  end

  private
  
    def recipe_params
  	  params.require(:recipe).permit(:name, :summary, :description, :picture)
    end

end