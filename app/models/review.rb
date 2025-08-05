class Review < ApplicationRecord
    belongs_to :book
    belongs_to :user

    validates :rating, inclusion: { in: 1..5, message: "must be between 1 and 5" }

    validates :content, length: { maximum: 1000, message: "is too long (maximum is 1000 characters)" }
end
