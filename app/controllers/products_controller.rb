class ProductsController < ApplicationController
	before_action :check_login, only: [:create, :newproduct]

	def index
	end

	def detail
		if Product.exists?(id: params[:product_id])
			@product = Product.find(params[:product_id])
		else
			render json: {error: "dont have product"}
		end
	end

	def category
	end

	def receipts
		@products = Product.order(id: :desc)
	end

	def search
	end

	def newproduct
		@categorys = Category.all
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
			params.require(:product).permit(:title, :description, :status, :quantity, :category_id, :price )
		end

		def check_login
			if !session[:user]
				redirect_to users_login_path
			end
		end
end