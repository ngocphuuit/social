class WelcomeController < ApplicationController

	def index
	end

	def sendcontact
		name		= params[:name]
		email		= params[:email]
		phone		= params[:phone]
		comments	= params[:comments]

		UserContact.contact(name, email, phone, comments).deliver_now
		return head :ok
	end

	def contact

	end

	def blog
	end

	def blogdetail
	end
end