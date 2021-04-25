class CreateUserDailyQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :user_daily_questionnaires do |t|
      t.date :questionnaireDate, :null => false
      t.integer :user_datum_id, :null => false      
      t.belongs_to :daily_questionnaire, index: true
      t.timestamps
    end
  end
end
