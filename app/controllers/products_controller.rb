class ProductsController < ApplicationController
  include ActiveStorage::SetCurrent 
  before_action :authenticate_user!
  def index
    @products = current_user.products.order(created_at: :desc)
  end

  def show
    @product = Product.find(params[:id])
    # @attachment = @product.attachments.new
    @attachment = Attachment.new
  end


  def new
    # @product = Product.new
    @product = current_user.products.new
  end



  def create
    @product = current_user.products.new(product_params)
    if @product.save
      service = StripeProduct.new(params, @product)
      service.create_product
      redirect_to @product
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    # this isnt finished, i think they said it was tough to update, best to create a new product

    return

    # @product = Product.find(params[:id])
    # if @product.update(product_params)
    #   service = StripeProduct.new(params, @product)
    #   service.update_product      
    #   redirect_to @product
    # else
    #   render :edit
    # end
  end  

  private

  def product_params
    params.require(:product).permit(:name, :description, :photo)
  end    
end
