class CreateUserDailyQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :user_daily_questionnaires do |t|
      t.belongs_to :user, foreign_key: true
      t.string :day_of_week, :null => false
      t.date :questionnaire_date, :null => false
      t.integer :user_mood, :null => false
      t.integer :duration_mins, :null => false
      t.integer :duration_score, :null => false
      t.integer :indoor_score, :null => false
      t.integer :outdoor_score, :null => false
      t.integer :cardio_score, :null => false
      t.integer :strength_score, :null => false
      t.integer :physicality_score, :null => false
      t.integer :mentality_score, :null => false
      t.integer :solo_score, :null => false
      t.integer :team_score, :null => false
      t.integer :intensity_score, :null => false
      t.string :location

      t.timestamps
    end
  end
end
