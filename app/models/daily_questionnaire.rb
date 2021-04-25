class DailyQuestionnaire < ApplicationRecord
    # A daily questionnaire has one user daily questionnaire as record, but association was built as has_many
    # May change afterwards
    has_many :user_daily_questionnaires, dependent: :destroy

    # Validate all parameters to be presence
    validates :user_mood, :duration_mins,:indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, presence: true
    validates :user_mood, :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
    
    daysOfWeek=["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
    validates :dayOfWeek, presence: true, inclusion: { in: daysOfWeek, message: "%{value} is not a valid day of the week, please re-enter a day of the week" } 

end