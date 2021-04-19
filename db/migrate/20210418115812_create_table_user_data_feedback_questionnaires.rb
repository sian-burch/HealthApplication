class CreateTableUserDataFeedbackQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_join_table :user_data, :user_feedback_questionnaires do |t|
      t.index :user_feedback_questionnaire_id, name:"user_feedback_questionnaire_id_on_user_datum_id_"
      t.index :user_datum_id, name:"user_datum_id_on_user_feedback_questionnaire_id"
    end
  end
end
