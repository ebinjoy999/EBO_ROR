class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|

    	t.string :first_name
    	t.string :middle_name
    	t.string :last_name
    	t.string :user_ID
    	t.string :password
    	t.string :password_confirmation
    	t.string :email
    	t.string :emloyee_ID
    	t.string :dob
    	t.string :gender
    	t.string :time_zone
    	t.string :desgnation_id
    	t.string :doj
        t.string :educational_detail
    	t.string :comments
        t.string :lock
    	t.string :active
    	t.string :deactive_date
    	t.string :deactive_reason
    	t.string :work_phone

      t.timestamps null: false
    end
  end
end