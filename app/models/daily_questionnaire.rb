class DailyQuestionnaire < ApplicationRecord
    # Daily Questionnaires can have many versions, eg: A version for each day of a week.
    # So the questionnaire for this day of a week can be used by "user_daily_questionnaires" objects on the corresponding dates
    has_many :user_daily_questionnaires

    # Validate all parameters to be presence
    validates :user_mood, :duration_mins,:indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, presence: true
    validates :user_mood, :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    
    daysOfWeek=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    validates :dayOfWeek, presence: true, inclusion: { in: daysOfWeek, message: "%{value} is not a valid day of the week, please re-enter a day of the week" } 
    
end
