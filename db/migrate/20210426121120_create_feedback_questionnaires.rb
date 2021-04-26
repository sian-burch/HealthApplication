class CreateFeedbackQuestionnaires < ActiveRecord::Migration[5.2]
  def change
    create_table :feedback_questionnaires do |t|
      t.string :dayOfWeek, :null => false
      t.integer :user_satisfaction, default: 0, :null => false
      t.integer :soreness_level, default: 0, :null => false
      t.timestamps
    end
    add_column :user_feedback_questionnaires, :feedback_questionnaire_id, :integer
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
    add_index(:user_feedback_questionnaires, :feedback_questionnaire_id, :name =>  "feedbackQuestionnaireIndex")
  end
end
