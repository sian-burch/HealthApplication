class UserFeedbackQuestionnaire < ApplicationRecord

    has_and_belongs_to_many :user_data
    belongs_to :feedback_questionnaire, :foreign_key => "feedback_questionnaire_id" , optional: true
    validates_uniqueness_of :feedback_questionnaire_id
end
