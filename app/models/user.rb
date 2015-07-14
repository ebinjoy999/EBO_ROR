class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

	belongs_to :designation
  belongs_to :role
  validates :first_name, :last_name,  presence:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :user_ID, :emloyee_ID, :doj,:dob, presence:true
  validates_uniqueness_of :user_ID
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #validates :lname, presence:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :work_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Wrong format" }
  #validates :uid, presence:true, message: "User id can't be blank"


#   before_filter :configure_permitted_parameters

#   protected

#   def configure_permitted_parameters
#     devise_parameter_sanitizer.for(:sign_up).push(:designation_id,:first_name, :middle_name, :last_name, :user_ID, :password, :password_confirmation, :email, :emloyee_ID, :dob, :gender, :time_zone, :doj, :educational_detail, :comments, :lock, :active, :deactive_date, :deactive_reason, :work_phone )
#   end
# end

end			
