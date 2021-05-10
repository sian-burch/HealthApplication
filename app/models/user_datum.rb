class UserDatum < ApplicationRecord
	
	require 'matrix'
	before_save :calculate_BMI, :calculate_recommended_daily_steps
	belongs_to :user

	scope :user_user_data, ->(user){where(['user_id = ?',user.id])}
	validates :height, :weight, :age, numericality: { greater_than: 0}
	validates :physical, presence: true, unless: :mental
 	validates :mental, presence: true, unless: :physical
	validates :age,:gender,:athletic_lvl,:indoor_score, :outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score, presence:true
	validates :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

	def calculate_BMI
      self.BMI=(self.weight/((self.height.to_f/100)**2)).round(1)
    end
    def calculate_recommended_daily_steps
        athl_lvl=self.athletic_lvl
        puts("athl_lvl: " + athl_lvl.to_s)
        puts("Self.age: " + self.age.to_s)
        puts("RecommendedDailyStep: " + RecommendedDailyStep.to_s)
        puts("RecommendedDailyStep.find_by(age: self.age): "+RecommendedDailyStep.find_by(age: self.age).to_s)
        age_recommendation=self.recommended_daily_steps=RecommendedDailyStep.find_by(age: self.age)
        puts("age_recommendation: " + age_recommendation.to_s)
        case athl_lvl
        when "Beginner"
            self.recommended_daily_steps=age_recommendation.minimum
        when "Intermediate"
            self.recommended_daily_steps=age_recommendation.medium
        when "Advanced"
            self.recommended_daily_steps=age_recommendation.high
        else
            self.recommended_daily_steps=0
        end    
    end

end
