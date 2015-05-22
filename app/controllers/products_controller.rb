class ProductsController < ApplicationController
	before_action :check_login, only: [:create, :newreceipt]

	def index
	end

	def detail
		@product = Product.find(params[:product_id])
		puts(@product)
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
		@product.user_id = session[:user]["id"]
		if @product.save
			redirect_to products_detail_path(product_id: @product.id)
		else
			redirect_to products_newreceipts_path
		end
	end

	private
		def product_params
			params.require(:product).permit(:title, :description, :status, :quantity)
		end

		def check_login
			if !session[:user]
				redirect_to users_login_path
			end
		end
end