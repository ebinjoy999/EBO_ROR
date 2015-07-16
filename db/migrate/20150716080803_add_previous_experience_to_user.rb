class AddPreviousExperienceToUser < ActiveRecord::Migration
  def change
    add_column :users, :previous_experience, :float
  end
end
