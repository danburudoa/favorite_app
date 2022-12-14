class FavoritesController < ApplicationController

  def create
    # @favorite = Favorite.new(user_id: current_user.id, recipe_id: params[:recipe_id])
    # 上記は、最初に書いた文で間違っていないが、下記の文の方が良い。
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.new(recipe_id: @recipe.id)
    favorite.save
  end

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    favorite = current_user.favorites.find_by(recipe_id: @recipe.id)
    favorite.destroy
  end
end
