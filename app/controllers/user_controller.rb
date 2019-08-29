class UserController < ApplicationController
#  before_action :logged_in_user, only: [:index]

  def index
    @users = User.all
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    if @user.destroy
        redirect_to root_url, notice: "User deleted."
    end
  end

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
