require 'rails_helper'

RSpec.feature "User Login", type: :feature do
      before do
          @user = User.new(email:"eugene@eugene.com",password:"12345678",password_confirmation:"12345678")
          @user.save
      end

      scenario "a signed-up user can sign in successfully" do
          visit root_path
          
          click_link "Login"
          fill_in "email", with:"eugene@eugene.com"
          fill_in "password", with:"12345678"
          click_button "Login"
          
          expect(page).to have_text "To-Do List:"
      end

      scenario "a non-signed-up user failed to sign in" do
          visit root_path
          
          click_link "Login"
          fill_in "email",with:"jack@jack.com"
          fill_in "password",with:"11111111"
          click_button "Login"
          
          expect(current_path).to eq "/login"
      end
end