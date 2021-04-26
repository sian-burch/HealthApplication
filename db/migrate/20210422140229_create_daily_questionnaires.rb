class CreateDailyQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :daily_questionnaires do |t|
      t.string :dayOfWeek, :null => false
      t.integer :user_daily_questionnaire_id
      t.integer :user_mood, :null => false
      t.integer :duration_mins, default: 0, :null => false
      t.integer :indoor_score, default: 0, :null => false
      t.integer :outdoor_score, default: 0, :null => false
      t.integer :cardio_score, default: 0, :null => false
      t.integer :strength_score, default: 0, :null => false
      t.integer :physicality_score, default: 0, :null => false
      t.integer :mentality_score, default: 0, :null => false
      t.integer :solo_score, default: 0, :null => false
      t.integer :team_score, default: 0, :null => false
      t.integer :intensity_score, default: 0, :null => false
      t.integer :duration_score, default: 0, :null => false

      t.timestamps
    end
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
