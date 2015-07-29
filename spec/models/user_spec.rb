describe User do

  it "is invalid without a firstname" do
    user = FactoryGirl.build(:user, first_name: nil)
    user.valid?
    expect(user.errors[:first_name]).to include("can't be blank")
  end

  # it "is invalid with a duplicate email address" do
  #   user = FactoryGirl.build(:user)
  #   user2 = FactoryGirl.build(:user)
  #   user2.valid?
  #   expect(user.errors[:email]).to include("already been taken")
  # end

  it "is invalid without a First_Name" do
     user=FactoryGirl.build(:user, :first_name => "")
     #user=FactoryGirl.build(:user, first_name: "Ebin") #override by factory girl first_name
     # user =User.new(:first_name => "") #Replace by factory girls here
     expect(user).to be_invalid
  end

  it "is invalid without a Last Name" do
    user = FactoryGirl.build(:user,:last_name => "")
    expect(user).to be_invalid
  end

  it "is invalid without a Email" do
    user = FactoryGirl.build(:user,:email=> "invalidmailaddress")
    expect(user).to be_invalid
  end

  it "is invalid without a Password" do
    user =User.new(:password => "")
    expect(user).to be_invalid
  end

  it "is invalid without a Password Confirmation" do
    user =User.new(:password_confirmation => "")
    expect(user).to be_invalid
  end

  it "is invalid phone number format" do
    user = FactoryGirl.build(:user)
    expect(user).to be_valid
  end

  it "is invalid without a User ID" do
    user =User.new(:user_ID => "")
    expect(user).to be_invalid
  end

  context 'calculate_total_experience' do
    it "gives total experience" do
      user = FactoryGirl.create(:user)
      expect(user.calculate_total_experience).to eq(3.0)
    end
  end

  context 'calculate user lock status' do
    it "Give the lock status of user" do
      user = FactoryGirl.create(:user)
      expect(user.calculate_lock_status).to include("True")
    end
  end

  context 'calculate user active status' do
    it "gives whether where a user is Active" do
    user = FactoryGirl.create(:user)
    expect(user.calculate_active_status).to eq("False")
     end
    end
end
