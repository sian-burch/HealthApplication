class ChangeUserDatumFields < ActiveRecord::Migration[5.2]
  def change
  	remove_column :user_data, :meditation
  	remove_column :user_data, :running
  	remove_column :user_data, :walking
  	rename_column :user_data, :indoor, :indoor_score
  	change_column :user_data, :indoor_score, :integer, default: 0
  	rename_column :user_data, :outdoor, :outdoor_score
  	change_column :user_data, :outdoor_score, :integer, default: 0
  	add_column :user_data, :cardio_score, :integer, default: 0, null: false
  	add_column :user_data, :strength_score, :integer, default: 0, null: false
  	add_column :user_data, :physicality_score, :integer, default: 0, null: false
  	add_column :user_data, :mentality_score, :integer, default: 0, null: false
  	add_column :user_data, :solo_score, :integer, default: 0, null: false
  	add_column :user_data, :team_score, :integer, default: 0, null: false
  	add_column :user_data, :intensity_score, :integer, default: 0, null: false
  end
end
