class Admin::UsersController < ApplicationController
  load_and_authorize_resource except: [:create]
  def index
   @users = User.all
   @designation_array = Designation.all.map { |d| d.designation_name  }
   @user  = current_user
   @user.active = true
   @user.save
  end
  
  def new
   # byebug
	 @user = User.new
  end

  def create
   @user =User.new(user_params)
   if @user.save
    redirect_to root_path
   else
    render :new
   end
  end           

  def show
   @user = User.find(params[:id])
   @tot_exp = @user.calculate_total_experience
  end

  def edit
	 @user = User.find(params[:id])
  end
  
  def update
	 @user = User.find(params[:id])
   # resource.update_without_password(params)
	 if @user.update(params.require(:user).permit(:previous_experience, :role_id,:designation_id,:first_name, :middle_name, :last_name, :user_ID, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone))
		redirect_to root_path
	 else
     render :edit
   end	
  end
  
  def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to root_path
  end  

private 
 def user_params
  # @designation_array = Designation.all.map { |d| [d.designation_name, d.id]  }
  params.require(:user).permit(:previous_experience, :role_id,:designation_id,:first_name, :middle_name, :last_name, :user_ID, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone)
 end
end


