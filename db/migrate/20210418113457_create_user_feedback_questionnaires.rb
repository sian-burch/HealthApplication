class CreateUserFeedbackQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :user_feedback_questionnaires do |t|
      t.date :questionnaireDate, :null => false
      t.integer :user_datum_id, :null => false 
      t.timestamps
    end
  end
end
