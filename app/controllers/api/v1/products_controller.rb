module Api::V1
  class ProductsController < ApplicationController
    before_action :set_product, only: [:show, :update, :destroy]

    # GET /products
    # Returns a JSON of all products in stock
    def index
      @products = Product.where('inventory_count > 0')

      render json: @products
    end

    # GET /products/:id
    # Returns a JSON of the product at :id
    def show
      render json: @product
    end

    # POST /products
    # Used to create a new product in the database
    def create
      @product = Product.new(product_params)

      if @product.save
        render json: @product, status: :created, location: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # PATCH/PUT /products/1
    # Used to update a new product in the database
    def update
      if @product.update(product_params)
        render json: @product
      else
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    # GET /products/:id/purchase
    # Returns a json of the product with an editted stock amount
    # Also changes the database stock count directly
    def purchase
      @product = Product.find(params[:id])   
      if @product.inventory_count > 0
        @product.update(inventory_count: @product.inventory_count - 1)
        puts "Product Successfully Purchased: #{@product.inventory_count} " \
                + "items left in stock for #{@product.title}"
        render json: @product
      else
        puts "Product Failed to Purchase: #{@product.inventory_count}" \
              + " items left in stock for #{@product.title}"
        render json: @product.errors, status: :unprocessable_entity
      end
    end

    private 
      # Use callbacks to share common setup or constraints between actions.
      def set_product
          @product = Product.find(params[:id])
      end 
  
      # Require the creation of title, price and inventory_count when creating.
      # sets each param to null as default
      def product_params
        params.require(:product, :title, :price, :inventory_count)
      end
  end
end
