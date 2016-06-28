class ProductsController < ApplicationController

helper_method :sort_column, :sort_direction

def index

  if params[:category]
    category=Category.find(params[:category])
    @products=category.products.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  else
    @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end
  @categories=Category.all.map { |c| [c.name, c.id]}
  @cart=current_user.carts if current_user 

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
  if @product.save
    redirect_to products_path
  else
    render 'edit'
  end
end

def destroy
  @product=Product.find(params[:id])
  @product.destroy
  redirect_to products_path
end


private
  def product_params
    params.require(:product).permit(:name, :description ,:image_url, :price)
  end

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : "name"
  end
  
  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end

end