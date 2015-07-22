class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :profile_picture, ProfilePictureUploader
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  devise :database_authenticatable, :registerable,:recoverable, :rememberable, :trackable, :validatable, :lockable
  belongs_to :designation
  belongs_to :role

  validates :first_name, :last_name,  presence:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :user_ID, :emloyee_ID, :doj,:dob, presence:true
  validates_uniqueness_of :user_ID
  validates :password, confirmation: true
  validates :previous_experience, presence: true, format:{with: /\A[-+]?[0-9]*\.?[0-9]+\Z/}
  validates :password, :password_confirmation, presence: true, 
  :if => lambda{ new_record? || !password.nil?}
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #validates :lname, presence:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :work_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Wrong format" }

  def calculate_total_experience
    if(previous_experience!=nil)
      #hh = Date.new(doj)
      gg = Date.strptime(doj, '%m-%d-%Y').strftime("%Y/%m/%d") 
      a = ((Date.today - Date.parse(gg)).to_f/365 )
      
      case
       when a > 0
        return ((a + previous_experience).round(2))
       when a < 1
          return previous_experience 
       end
    end
  end

  def calculate_lock_status
   case
    when lock=="1"
      return "True"
    when lock!="1"
      return "False"
    end
  end

  def calculate_active_status
    case
      when active=="1"
        return "True"
      when active!="1"
        return "False"
    end
  end
end
