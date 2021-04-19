class AddIndexUserDatumIdToFeedback < ActiveRecord::Migration[5.2]
  def change
    add_index :user_feedback_questionnaires, :user_datum_id
  end
end
