class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
    id = params[:id]
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
   	review = Review.find(params[:id])
    review.update(review_params)
    redirect_to review_path(review.id)
  end

  def destroy
  	review = Review.find(params[:id])
  	review.destroy
  	redirect_to reviews_path
  end

  def create
  	review = Review.new(review_params)
  	if review.save
      redirect_to review_path(review.id), notice: "Book was successfully created."
    else
      render action: :show
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :body)
    end
end