class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :check_login, only: [:info, :timeline]

	def info
		@user = User.find(session[:user]["id"])
		@products = @user.products
	end

	def timeline
	end

	def login_form
	end

	def login
		if User.exists?(email: params[:user][:email])
			@user = User.find_by(email: params[:user][:email])
			if @user.password == params[:user][:password]
				session[:user] = @user
				redirect_to users_info_path
			else
				redirect_to users_login_path
			end
		else
			redirect_to users_login_path
		end
	end

	def logout
		session.delete(:user)
		redirect_to users_login_path
	end

	def register_form
	end

	def register
		if params[:user][:password] == params[:user][:confirm_password]
			if User.exists?(email: params[:user][:email]) || validate_email(params[:user][:email])
				redirect_to users_register_path
			else
				@user = User.new(user_params)
				@user.password = params[:user][:password]
				if @user.save
					redirect_to users_login_path
				else
					redirect_to users_register_path
				end
			end
		else
			redirect_to users_register_path
		end
	end

	private
		def check_login
			if !session[:user]
				redirect_to users_login_path
			end
		end

		def user_params
			params.require(:user).permit(:name, :email)
		end

		def validate_email(email)
			email !~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
		end
end