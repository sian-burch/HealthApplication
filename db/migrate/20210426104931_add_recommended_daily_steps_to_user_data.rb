class AddRecommendedDailyStepsToUserData < ActiveRecord::Migration[5.2]
  def change
    add_column :user_data, :recommended_daily_steps, :integer
  end
end
