class RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]
  before_action :correct_user, only: [:edit, :update, :destroy]


  def index
    @categories = recipe_categories
    if params.include?(:category)
      @recipes = Recipe.where(category: params[:category]).paginate(page: params[:page]).order("created_at DESC")
      @active_btn = params[:category]
    else
      @recipes = Recipe.paginate(page: params[:page]).order("created_at DESC")
    end
  end

  def show
  end

  def new
    @recipe = current_user.recipes.build
    @categories = recipe_categories
  end

  def edit
    @categories = recipe_categories
  end

  def create
    @recipe = current_user.recipes.build(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to @recipe, notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to @recipe, notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @recipe.destroy
    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def recipe_params
      params.require(:recipe).permit(:name, :description, :category, :steps)
    end

    def recipe_categories
      [ 'Breakfast', 'Main Dish', 'Snack', 'Dessert' ]
    end

    def correct_user
      @recipe = current_user.recipes.find_by(id: params[:id])
      redirect_to recipes_path, notice: "You are not allowed to edit this pin" if @recipe.nil?
    end
end
