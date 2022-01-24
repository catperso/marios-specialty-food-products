class ProductsController < ApplicationController

  before_action :only => [:new, :edit] do
    flash[:alert] = "UNAUTHORIZED ACCESS: Please log-in with an admin account to access that resource."
    redirect_to root_path unless is_admin?
  end

  def landing
    @products = Product.all
    @usa = Product.usa
    @threecent = Product.three_most_recent
    @popular = Product.most_reviews
    render :landing
  end

  def index
    @products = Product.all
    render :index
  end

  def new
    @product = Product.new
    render :new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Product successfully added!"
      redirect_to products_path
    else
      flash[:alert] = "Errors detected! Please resolve the issues and try again."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
    render :edit
  end

  def show
    @product = Product.find(params[:id])
    render :show
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      flash[:notice] = "Product successfully updated!"
      redirect_to products_path
    else
      flash[:alert] = "Errors detected! Please resolve the issues and try again."
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:notice] = "Product removed successfully!"
    redirect_to products_path
  end

  private
    def product_params
      params.require(:product).permit(:name, :cost, :country_of_origin)
    end
end