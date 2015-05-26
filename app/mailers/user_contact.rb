class UserContact < ApplicationMailer
	default from: "ngocphu.uit@gmail.com"

	def contact(name, email, phone, comments)
		@name = name
		@email = email
		@phone = phone
		@comments = comments
		mail(to: "ngocphu.uit@gmail.com", subject: 'Welcome to our app')
	end

end
