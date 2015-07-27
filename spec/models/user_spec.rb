describe User do
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
end
