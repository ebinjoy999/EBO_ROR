require 'spec_helper'
RSpec.describe Admin::UsersController do
  before(:each) do
    @role = FactoryGirl.create(:role,:name => "adminstrator")
    @desig = FactoryGirl.create(:designation,:designation_name => "Trainee")
    @user = FactoryGirl.create(:user, :role => @role)
    sign_in @user
  end

  describe "GET index" do
    it "renders the :index view" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested user to @user" do
      get :show, id: @user
      expect(assigns(:user)).to eq(@user)
    end
    it "renders the #show view" do
      get :show, id: @user
      expect(response).to render_template :show
    end
  end

  describe "POST create" do
    context "with valid attributes" do
      it "creates a new user" do
        post :create, user: FactoryGirl.attributes_for(:user, email: 'sdsdfsfsf@dsfsd.sdfd', user_ID: 'sada324')
        expect(assigns(:user)).to eq(User.last)
      end

      it "redirects to the new user" do
        post :create, user: FactoryGirl.attributes_for(:user, email: 'sdsfddfsfsf@dsfsd.sdfd', user_ID: 'sadda324')
        expect(response).to redirect_to root_path
      end
    end
    context "with invalid attributes" do
      it "does not save the new user" do
        expect{
          post :create, user: FactoryGirl.attributes_for(:user, first_name: '')
        }.to_not change(User,:count)
      end
      it "re-renders the new method" do
        post :create, user: FactoryGirl.attributes_for(:user, first_name: '')
        expect(response).to render_template :new
      end
    end
  end

  describe "PUT Update" do
    context "with valid attributes" do
      it "Update the user" do
        patch :update, id: @user, user: FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to root_path
      end
    end
  end

  context "Destroy user" do
    it "Delete the user" do
      delete :destroy, id: @user, user: FactoryGirl.attributes_for(:user)
      expect(response).to redirect_to root_path
    end
  end
end
