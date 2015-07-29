require 'rails_helper'
RSpec.describe "Users", type: :request do
  describe "The signin process", :type => :feature do
    # before :each do
    #   p @role = FactoryGirl.create(:role)
    #   p @des = FactoryGirl.create(:designation,:designation_name => "trainee")
    #  p @user = FactoryGirl.create(:user,role_id: @role.id,designation_id: @des.id)
    #  p @user.role
    # end
    it "signs me in" do
      @role = FactoryGirl.create(:role)
      @des = FactoryGirl.create(:designation,:designation_name => "trainee")
      @user = FactoryGirl.create(:user,role_id: @role.id,designation_id: @des.id)
      @user.role
      visit new_user_session_path
      within("#session") do
        fill_in 'email', :with => 'xfs23@ds.sdf'
        fill_in 'password', :with => '1234567890'
         save_and_open_page
      end
      click_button "Log in"
      save_and_open_page
      expect(page).to have_content 'REGISTERED USERS LIST'
    end
  end
end
