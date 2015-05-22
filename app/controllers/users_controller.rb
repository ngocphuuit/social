class UsersController < ApplicationController
	skip_before_action :verify_authenticity_token
	before_action :check_login, only: [:info, :timeline]

	def info
		
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
	end

	def register_form
	end

	def register
		if User.exists?(email: params[:user][:email])
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
end