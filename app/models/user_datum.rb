class UserDatum < ApplicationRecord
	before_save :calculate_BMI
	belongs_to :user

	scope :user_user_data, ->(user){where(['user_id = ?',user.id])}
	
	def calculate_BMI
      self.BMI=(self.weight/((self.height.to_f/100)**2)).round(1)
    end
end