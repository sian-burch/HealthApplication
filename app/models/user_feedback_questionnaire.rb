class UserFeedbackQuestionnaire < ApplicationRecord

    has_and_belongs_to_many :user_data

end
