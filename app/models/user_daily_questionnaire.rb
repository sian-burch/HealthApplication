class UserDailyQuestionnaire < ApplicationRecord
	require 'matrix'
    belongs_to :user

    # Validate all parameters to be presence
    validates :user_mood, :duration_mins,:indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, presence: true
    validates :user_mood, :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, :duration_score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "Should choose one option for every question" }

 	def create_user_scores
    	@user_scores=Vector[self.indoor_score,self.outdoor_score,self.cardio_score,self.strength_score,self.physicality_score,self.mentality_score,self.solo_score,self.team_score,self.intensity_score]
    end

   

    def user_activity_similarity(activity)
    	user=@user_scores
    	activ=Vector[activity.indoor_score,activity.outdoor_score,activity.cardio_score,activity.strength_score,activity.physicality_score,activity.mentality_score,activity.solo_score,activity.team_score,activity.intensity_score]

    	numerator=user.inner_product(activ)
	 	denominator=user.r*activ.r

	 	similarity_score=(numerator/denominator)*100 #making it in range 0-100

		#  Should have catch / if statement for similarity_score = 0
		# Would cause FloatDomainError which occurs when both values are zero
		# Because zero divided by zero is NaN
		# and although NaN is a float, attempting to send it a floor message results in that error
		
	 	return similarity_score.to_i
    end
    def user_recommendations
    	recommendations=[]
    	self.create_user_scores
    	Activity.all.each do |activity|
    		similarity_score=self.user_activity_similarity(activity)
    		recommendations.push({activity: activity,similarity_score: similarity_score})
    	end
    	ranked=recommendations.sort_by{|recommendation| -recommendation[:similarity_score]}
    	return ranked
    end

end
