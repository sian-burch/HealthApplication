class UserDailyQuestionnaire < ApplicationRecord
	require 'matrix'
    belongs_to :user
	before_validation :opposite_fields

    # Validate all parameters to be presence
    validates :user_mood, :duration_mins,:indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, presence: true
    validates :user_mood, :indoor_score,:outdoor_score,:cardio_score,:strength_score,:physicality_score,:mentality_score,:solo_score, :solo_score, :team_score,:intensity_score, :duration_score, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "Should choose one option for every question" }

 	def create_user_scores
    	@user_scores=Vector[self.indoor_score,self.outdoor_score,self.cardio_score,self.strength_score,self.physicality_score,self.mentality_score,self.solo_score,self.team_score,self.intensity_score]
	end

   	def opposite_fields
		puts("Mentality: " + self.mentality_score.to_s)
		puts("Outdoor:" + self.outdoor_score.to_s + ", Teams: " + self.team_score.to_s)
		if self.indoor_score == nil && self.outdoor_score != 0
			if self.outdoor_score == 5
				self.indoor_score = 1
			elsif self.outdoor_score == 4
				self.indoor_score = 2
			elsif self.outdoor_score == 3
				self.indoor_score = 3
			elsif self.outdoor_score == 2
				self.indoor_score = 4
			elsif self.outdoor_score == 1
				self.indoor_score = 5
			end
		end
	  	if self.outdoor_score == nil && self.indoor_score != 0
			if self.indoor_score == 5
				self.outdoor_score = 1
			elsif self.indoor_score == 4
				self.outdoor_score = 2
			elsif self.indoor_score == 3
				self.outdoor_score = 3
			elsif self.indoor_score == 2
				self.outdoor_score = 4
			elsif self.indoor_score == 1
				self.outdoor_score = 5
        	end 
      	end
		if self.cardio_score == nil && self.strength_score != 0
			if self.strength_score == 5
				self.cardio_score = 1
			elsif self.strength_score == 4
				self.cardio_score = 2
			elsif self.strength_score == 3
				self.cardio_score = 3
			elsif self.strength_score == 2
				self.cardio_score = 4
			elsif self.strength_score == 1
				self.cardio_score = 5
			end 
      	end
		if self.strength_score == nil && self.cardio_score != 0
			if self.cardio_score == 5
				self.strength_score = 1
			elsif self.cardio_score == 4
				self.strength_score = 2
			elsif self.cardio_score == 3
				self.strength_score = 3
			elsif self.cardio_score == 2
				self.strength_score = 4
			elsif self.cardio_score == 1
				self.strength_score = 5
			end 
      	end
		if self.solo_score == nil && self.team_score != 0
			if self.team_score == 5
				self.solo_score = 1
			elsif self.team_score == 4
				self.solo_score = 2
			elsif self.team_score == 3
				self.solo_score = 3
			elsif self.team_score == 2
				self.solo_score = 4
			elsif self.team_score == 1
				self.solo_score = 5
			end 
		end
		if self.team_score == nil && self.solo_score != 0
			if self.solo_score == 5
				self.team_score = 1
			elsif self.solo_score == 4
				self.team_score = 2
			elsif self.solo_score == 3
				self.team_score = 3
			elsif self.solo_score == 2
				self.team_score = 4
			elsif self.solo_score == 1
				self.team_score = 5
			end 
		end
		if self.duration_score == nil && self.duration_mins != 0
			if self.duration_mins <= 12 && self.duration_mins > 0
				self.duration_score = 1
			elsif self.duration_mins <= 24 && self.duration_mins > 12
				self.duration_score = 2
			elsif self.duration_mins <= 36 && self.duration_mins > 24
				self.duration_score = 3
			elsif self.duration_mins <= 48 && self.duration_mins > 36
				self.duration_score = 4
			elsif self.duration_mins <= 60 && self.duration_mins > 48
				self.duration_score = 5
			end 
		end
		if self.physicality_score == 5 && self.mentality_score == 5
			puts("TEST PASSED")
			if ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 1
				self.physicality_score = 1
				self.mentality_score = 5
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 2
				self.physicality_score = 2
				self.mentality_score = 4
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 3
				self.physicality_score = 3
				self.mentality_score = 3
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 4
				self.physicality_score = 4
				self.mentality_score = 2
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 5
				self.physicality_score = 5
				self.mentality_score = 1
			end 
		end
		if self.physicality_score == nil && self.mentality_score == nil
			puts("TEST PASSED")
			if ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 1
				self.physicality_score = 1
				self.mentality_score = 5
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 2
				self.physicality_score = 2
				self.mentality_score = 4
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 3
				self.physicality_score = 3
				self.mentality_score = 3
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 4
				self.physicality_score = 4
				self.mentality_score = 2
			elsif ((self.outdoor_score + self.strength_score + self.intensity_score)/3).round == 5
				self.physicality_score = 5
				self.mentality_score = 1
			end 
		end
		puts("Physicality: " + self.physicality_score.to_s)
		puts("Mentality: " + self.mentality_score.to_s)
		puts("Outdoor:" + self.outdoor_score.to_s + ", Teams: " + self.team_score.to_s)
		puts("Cardio now:" + self.cardio_score.to_s + ", Strengh now: " + self.strength_score.to_s)
		puts("Physicality:" + ((((self.outdoor_score + self.strength_score + self.intensity_score)/3)).round.to_s))
		puts("Mentality:" + self.mentality_score.to_s)
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
