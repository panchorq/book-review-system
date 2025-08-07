class ReviewsController < ApplicationController
  before_action :set_book, only: [:new, :create]
  before_action :set_review, only: [:edit, :update, :destroy]

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params)
    @review.user = User.first

    if @review.save
      redirect_to @book, notice: 'La review se ha creado correctamente'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to @review.book, notice: 'La review se ha actualizado correctamente'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @review.destroy
    redirect_to @review.book, notice: 'La review se ha eliminado correctamente'
  end

  private

  def set_book
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
