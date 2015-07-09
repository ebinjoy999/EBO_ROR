class UsersController < ApplicationController
	def index
       @users = User.all
	end
	
def new
	@user = User.new
end

# def create
# 	 @user =User.new(params.require(:user).permit(:fname, :mname, :lname, :uid, :ppassword, :cpasswor, :email, :empid, :dob, :gender, :time_zone, :desg_id, :doj, :edu, :comm, :lock, :active, :deact_date, :deact_r, :wp))
     
#      @user.save
# 	redirect_to @user
# end

def create
       @user =User.new(user_params)
      if @user.save
            redirect_to @user
        else
            render :new
            end

 end           


def show
	@user = User.find(params[:id])
end


def edit
	@user = User.find(params[:id])
end

def update
	@user = User.find(params[:id])
	if @user.update(user_params)
		redirect_to @user
		else
            render :edit
            
	end	
end
  
def destroy
  	@user = User.find(params[:id])
  	@user.destroy
  	redirect_to users_path
  end  



private 

def user_params
  params.require(:user).permit(:first_name, :middle_name, :last_name, :user_ID, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :desgnation_id, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone)
end

end
