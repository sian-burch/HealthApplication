class UserDatum < ApplicationRecord
	before_save :calculate_BMI
	belongs_to :user

	scope :user_user_data, ->(user){where(['user_id = ?',user.id])}
	validates :height, :weight, :age, numericality: { greater_than: 0}
	validates :physical, presence: true, unless: :mental
 	validates :mental, presence: true, unless: :physical
	validates :indoor_score, :outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score, presence:true
	validates :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }

	def calculate_BMI
      self.BMI=(self.weight/((self.height.to_f/100)**2)).round(1)
    end
end
