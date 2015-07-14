class Admin::UsersController < ApplicationController
load_and_authorize_resource except: [:create]
	def index
    @users = User.all
    @designation_array = Designation.all.map { |d| d.designation_name  }
	end
	
def new
	@user = User.new
end



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
   # @designation_array = @user.designation.designation_name
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
  # @designation_array = Designation.all.map { |d| [d.designation_name, d.id]  }
  # params.require(:user).permit(@designation_array.find(:designation_id),:first_name, :middle_name, :last_name, :user_ID, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone)
    params.require(:user).permit(:role_id,:designation_id,:first_name, :middle_name, :last_name, :user_ID, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone)
end

end


