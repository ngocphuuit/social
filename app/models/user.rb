require 'bcrypt'
class User < ActiveRecord::Base
	mount_uploader :avatar, AvatarUploader
	include BCrypt

	has_many :products
	has_many :comments


	def password
		@password ||= Password.new(encrypted_password)
	end

	def password=(new_password)
		@password = Password.create(new_password)
		self.encrypted_password = @password
	end
end
