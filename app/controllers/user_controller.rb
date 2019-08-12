class UserController < ApplicationController
  def show
    @user = current_user
    @categories = recipe_categories
    if params.include?(:category)
      @recipes = @user.recipes.paginate(page: params[:page]).order("created_at DESC")
      @active_category_btn = params[:category]
    else
      @recipes = @user.recipes.paginate(page: params[:page]).order("created_at DESC")
    end
  end
end


def recipe_categories
  [ 'Breakfast', 'Main Dish', 'Snack', 'Dessert' ]
end
