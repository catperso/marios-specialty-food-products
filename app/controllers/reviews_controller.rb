class ReviewsController < ApplicationController

  before_action :only => [:edit] do
    flash[:alert] = "UNAUTHORIZED ACCESS: Please log-in with an admin account to access that resource."
    redirect_to root_path unless is_admin?
  end

  def new
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
    render :new
  end

  def create
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(review_params)
    if @review.save
      flash[:notice] = "Review created successfully!"
      redirect_to product_path(@product)
    else
      flash[:alert] = "Errors detected! Please resolve the issues and try again."
      render :new
    end
  end

  def show
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :show
  end

  def edit
    @product = Product.find(params[:product_id])
    @review = Review.find(params[:id])
    render :edit
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      flash[:notice] = "Review updated successfully!"
      redirect_to product_path(@review.product)
    else
      @product = Product.find(params[:product_id])
      flash[:alert] = "Errors detected! Please resolve the issues and try again."
      render :edit
    end
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    flash[:notice] = "Review removed successfully!"
    redirect_to product_path(@review.product)
  end

  private
    def review_params
      params.require(:review).permit(:author, :content_body, :rating)
    end
end