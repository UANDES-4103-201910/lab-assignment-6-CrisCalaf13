class User < ApplicationRecord
	has_many :user_tickets
	has_many :tickets, :through => :user_tickets

	validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}, uniqueness: true

	validates :phone, length: {minimum: 9, maximum: 12}, allow_blank: true
	validates :password, format: {with: /\A[a-zA-Z0-9\.]{8,12}\z/ , message: "assword must be between 8 to 12 alphanumeric characters"}

	def self.authenticate(email, password)
		user = find_by_email(email)
		if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
			user
		else
			nil
		end
	end

end
