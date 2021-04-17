class Activity < ApplicationRecord
	require 'matrix'
	 validates :name, :duration_mins,:indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score, presence: true
	 validates :name, length: { in: 2..50 }
	 validates :duration_mins, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 180 }
	 validates :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score,:team_score,:intensity_score, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }


	 def activity_similarity_score(activity)
	 	#method that uses cosine similarity between two vectors to calculate how similar they are
	 	activity1=Vector[self.indoor_score,self.outdoor_score,self.cardio_score,self.strength_score,self.physicality_score,self.mentality_score,self.solo_score,self.team_score,self.intensity_score]
	 	activity2=Vector[activity.indoor_score,activity.outdoor_score,activity.cardio_score,activity.strength_score,activity.physicality_score,activity.mentality_score,activity.solo_score,activity.team_score,activity.intensity_score]
	 	numerator=activity1.inner_product(activity2)
	 	denominator=activity1.r*activity2.r

	 	similarity_score=(numerator/denominator)*100 #making it in range 0-100
	 	return similarity_score.to_i
	 end

end
