class User < ApplicationRecord
	 has_secure_password

	 validates :email,
		presence: { message: "Email must not be blank."},
	    format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"},
	    uniqueness: true

	validates :password, on: :create,
        presence: { message: "Password must not be blank."},
        length: { minimum: 8 }
end
