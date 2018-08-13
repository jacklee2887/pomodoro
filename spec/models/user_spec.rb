require 'rails_helper'

	describe 'Testing password inputs when users signs up a new account' do
		context "when user password is valid in length" do
			it "should allow user to successfully create account" do
				@user_valid = User.new(email:"euegene@eugene.com", password:"12345678").save
				expect(User.all.size).to eq 1
			end
		end
		context "when user password is invalid in length" do
			it "should allow user to successfully create account" do
				@user_invalid = User.new(email:"euegene@eugene.com", password:"1234").save
				expect(User.all.size).to eq 0
			end
		end	
	end

	describe 'Testing that User Model and Tomato Model associations' do
		context "a user should have many tomatoes" do
			it "should expect that user can have many tomatoes, and tomatoes are dependent on users" do
				 user = User.reflect_on_association(:tomatoes)
				 expect(user.macro).to eq(:has_many)
			end
		end
	end
	