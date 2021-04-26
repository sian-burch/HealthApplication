class FeedbackQuestionnaire < ApplicationRecord

    has_one :user_feedback_questionnaire

    validates :dayOfWeek, :user_satisfaction, :soreness_level,  presence: true
    validates :user_satisfaction, :soreness_level, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    
    daysOfWeek=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    validates :dayOfWeek, presence: true, inclusion: { in: daysOfWeek, message: "%{value} is not a valid day of the week, please re-enter a day of the week" } 
end
