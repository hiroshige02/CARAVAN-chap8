class ReviewsController < ApplicationController
  def index
    @reviews = Review.all
    @review = Review.new
  end

  def show
    @review = Review.find(params[:id])
  end

  def edit
  	@review = Review.find(params[:id])
  end

  def update
   	@review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to review_path(@review.id)
    else
      render :edit
    end
  end

  def destroy
  	review = Review.find(params[:id])
  	review.destroy
  	redirect_to reviews_path
  end

  def create
  	@review = Review.new(review_params)
  	if @review.save
      redirect_to review_path(@review.id), notice: "Book was successfully created."
    else
      @reviews = Review.all
      render :index
    end
  end

  private
    def review_params
      params.require(:review).permit(:title, :body)
    end
end