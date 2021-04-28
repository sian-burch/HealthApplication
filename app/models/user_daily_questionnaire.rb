class UserDailyQuestionnaire < ApplicationRecord

    belongs_to :user

    # Validate all parameters to be presence
    validates :user_mood, :duration_mins,:indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, presence: true
    validates :user_mood, :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

end
