FactoryGirl.define do
  factory :user do |u|
    u.association :role
    u.association :designation
    u.first_name 'Ebin'
    u.last_name  'Joy'
    u.password '1234567890'
    u.password_confirmation '1234567890'
    u.email 'xfs23@ds.sdf'
    u.user_ID 'ebodsdf21321'
    u.emloyee_ID 'st342'
    u.dob '10-10-1994'
    u.work_phone '777-898-4545'
    u.doj '07-29-2014'
    u.lock '1'
    u.active '0'
    u.previous_experience 2.0
  end
end
