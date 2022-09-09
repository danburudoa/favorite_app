class Favorite < ApplicationRecord

  belongs_to :user
  belongs_to :recipe

  # recipe_idとuser_idの組がuniqueになったので、一通りしかない
  validates_uniqueness_of :recipe_id, scope: :user_id
end
