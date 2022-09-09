class Recipe < ApplicationRecord

  has_many :favorites, dependent: :destroy
  belongs_to :user

  with_options presence: true do 
    validates :title
    validates :body
  end
end
