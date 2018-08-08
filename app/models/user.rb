class User < ApplicationRecord
	 has_secure_password
	 has_many :authentications, dependent: :destroy

	def self.create_with_auth_and_hash(authentication, auth_hash)
		user = self.create!(
			email: auth_hash["info"]["email"],
			password: SecureRandom.hex(10)
		)
		user.authentications << authentication
		return user
	end

	# grab google to access google for user data
	def google_token
		x = self.authentications.find_by(provider: 'google_oauth2')
		return x.token unless x.nil?
	end

	 has_many :tasks
	 validates :email,
		presence: { message: "Email must not be blank."},
	    format: { with: /\w+@\w+\.\w{2,}/, message: "Email must be in format abc@example.com"},
	    uniqueness: true

	validates :password, on: :create,
        presence: { message: "Password must not be blank."},
        length: { minimum: 8 }
end
