class User < ActiveRecord::Base

  validates :first_name, :last_name,  presence:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :user_ID, :emloyee_ID, :doj,:dob, presence:true
  validates_uniqueness_of :user_ID
  validates :password, confirmation: true
  validates :password, :password_confirmation, presence: true
  validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  #validates :lname, presence:true, format: { with: /\A[a-zA-Z0-9]+\Z/ }
  validates :work_phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: "Wrong format" }
  #validates :uid, presence:true, message: "User id can't be blank"
end			