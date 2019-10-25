require 'rails_helper'

describe "User creation", type: :feature do
    before do
      visit new_user_path
      fill_in "Username", with: "Joey"
      fill_in "Password", with: "Password"
      fill_in "Password confirmation", with: "Password"
      fill_in "Fullname", with: "Joey Tribbiani"
      click_button "Create User"
    end

    let(:user) { User.find_by(name: "Joey") }
    it "creates a user" do
      expect(user).to_not be_nil
    end
   
    it "redirects to the root page" do
      expect(current_path).to eq(root_path)
    end

end