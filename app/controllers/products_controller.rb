class ProductsController < ApplicationController

	def index
	end

	def detail
	end

	def category
	end

	def receipts
	end

	def search
	end

	def newreceipt
	end

	def create
		@product = Product.new(product_params)
		@product.photo = params[:product][:photo]
		if @product.save
			redirect_to products_detail_path
		else
			redirect_to products_newreceipts_path
		end
	end

	private
		def product_params
			params.require(:product).permit(:title, :description, :status, :quantity)
		end
end