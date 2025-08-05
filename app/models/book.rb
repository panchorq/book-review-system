class User < ApplicationRecord
    has_many :reviews
  
    scope :not_banned, -> { where(banned: false) }
  end
  
  class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user
  
    scope :valid_for_average, -> { joins(:user).merge(User.not_banned) }
  end
  
  class Book < ApplicationRecord
    has_many :reviews
  
    def average_rating
      valid_reviews = reviews.valid_for_average
      if valid_reviews.count < 3
        "Reseñas Insuficientes"
      else
        valid_reviews.average(:rating).round(1)
      end
    end
  end
