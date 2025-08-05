require 'rails_helper'

RSpec.describe Book, type: :model do
  let(:book) { create(:book) }

  describe "#average_rating" do
    context "with 3 or more reviews" do
      before do
        create_list(:review, 2, book: book, rating: 4)
        create(:review, book: book, rating: 5)
      end

      it "calculates the average rating rounded to one decimal place" do
        expect(book.average_rating).to eq(4.3)
      end
    end

    context "with a banned user's review" do
      before do
        banned_user = create(:user, banned: true)
        create(:review, book: book, rating: 5, user: banned_user)
        create(:review, book: book, rating: 4)
        create(:review, book: book, rating: 5)
      end

      it "does not count banned users' reviews" do
        expect(book.average_rating).to eq(4.5)
      end
    end

    context "with less than 3 reviews" do
      before do
        create_list(:review, 2, book: book, rating: 4)
      end

      it "returns 'Reseñas Insuficientes'" do
        expect(book.average_rating).to eq("Reseñas Insuficientes")
      end
    end
  end
end