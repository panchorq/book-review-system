require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:user) { create(:user) }
  let(:book) { create(:book) }

  it "is valid with a rating between 1 and 5" do
    review = Review.new(rating: 3, content: "Great book!", user: user, book: book)
    expect(review).to be_valid
  end

  it "is not valid with a rating less than 1" do
    review = Review.new(rating: 0, content: "Bad book!", user: user, book: book)
    expect(review).to_not be_valid
    expect(review.errors[:rating]).to include("must be between 1 and 5")
  end

  it "is not valid with a rating greater than 5" do
    review = Review.new(rating: 6, content: "Amazing book!", user: user, book: book)
    expect(review).to_not be_valid
    expect(review.errors[:rating]).to include("must be between 1 and 5")
  end

  it "is valid with content up to 1000 characters" do
    content = "a" * 1000
    review = Review.new(rating: 4, content: content, user: user, book: book)
    expect(review).to be_valid
  end

  it "is not valid with content more than 1000 characters" do
    content = "a" * 1001
    review = Review.new(rating: 4, content: content, user: user, book: book)
    expect(review).to_not be_valid
    expect(review.errors[:content]).to include("is too long (maximum is 1000 characters)")
  end
end
