class ProductsController < ApplicationController
	
	def new

	end

	def create
		@product =  Product.new(product_params)
		if @product.save
			redirect_to action: 'index'
		else
			render :action => 'new'
		end
	end

	def show
		@article = Product.find(params[:id])
	end

	def index
		@products = Product.all
	end

	def edit
		@product = Product.find(params[:id])
	end

	def update
		@product = Product.find(params[:id])

		if @product.update(product_params)
			redirect_to :action => "index"
		else
			render 'edit'
		end
	end

	def destroy
		@product = Product.find(params[:id])
		@product.destroy
		redirect_to :action => 'index'
	end

	private
		def product_params
			params.require(:product).permit(:name, :price)
		end
end
