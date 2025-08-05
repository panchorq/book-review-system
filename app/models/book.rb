class Book < ApplicationRecord
    has_many :reviews

    def average_rating
        valid_reviews = reviews.joins(:user).where(users: { banned: false })
    
        if valid_reviews.count < 3
          return "Reseñas Insuficientes"
        end
    
        average = valid_reviews.average(:rating)
        average.round(1)
      end
end
