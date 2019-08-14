class UserController < ApplicationController
  def show
    @user = current_user
    @categories = [ 'Breakfast', 'Main Dish', 'Snack', 'Dessert' ]
    if params.include?(:category)
      @recipes = @user.recipes.where(category: params[:category]).paginate(page: params[:page]).order("created_at DESC")
    else
      @recipes = @user.recipes.paginate(page: params[:page]).order("created_at DESC")
    end
  end
end


def recipe_categories
  [ 'Breakfast', 'Main Dish', 'Snack', 'Dessert' ]
end
