class ProductsController < ApplicationController


  def index
    @products=Product.all
  end

  def new
    @product=Product.new
  end
  def create
    @product=Product.new(product_params)
    if @product.save
      redirect_to @product
    else
      render 'new'
    end

  end
  def edit
    @product=Product.find(params[:id])
  end

  def show
     @product=Product.find(params[:id])
  end

  def update
     @product=Product.find(params[:id])
     if product.save
      redirect_to products_path
    else
      render 'new'
    end
  end

  def destroy
    @product=Product.find(params[:id])
    @product.destroy
    redirect_to products_path
  end

  def product_params
    params.require(:product).permit(:name, :description ,:image_url, :price)
  end

end