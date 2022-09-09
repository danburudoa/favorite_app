class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :recipes, dependent: :destroy
  has_many :favorites, dependent: :destroy

  validates :name, presence: true

  # いいねを押したか押してないかを判定
  def already_favorited?(recipe)
    # current_user.favorite.find_by(recipe_id: params[:recipe_id]).present?
    self.favorites.exists?(recipe_id: recipe.id)
  end
end
