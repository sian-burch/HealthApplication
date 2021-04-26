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
        age_recommendation=self.recommended_daily_steps=RecommendedDailyStep.find_by(age: self.age)
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

    def create_user_scores
    	@total_feedbacks=2 #shouldn't be initialised to 1?
    	@user_scores=Vector[self.indoor_score,self.outdoor_score,self.cardio_score,self.strength_score,self.physicality_score,self.mentality_score,self.solo_score,self.team_score,self.intensity_score]
    end

    def update_user_scores(new_user_scores)
    	#ONLY WORKS WITH POSITIVE FEEDBACKS BECAUSE IT WILL CONTINUALLY INCREMENT THE SCORE FOR EACH ATTRIBUTE!
    	#NEED TO MODIFY TO TAKE INTO CONSIDERATION "NEGATIVE SCORES" (I.E. SCORES LESS THAT THE PREVIOUSLY STORED SCORES)
    	
    	new_indoor_score=((@total_feedbacks*@user_scores[0])+new_user_scores[0])/(@total_feedbacks+1)
    	new_outdoor_score=((@total_feedbacks*@user_scores[1])+new_user_scores[1])/(@total_feedbacks+1)
    	new_cardio_score=((@total_feedbacks*@user_scores[2])+new_user_scores[2])/(@total_feedbacks+1)
    	new_strength_score=((@total_feedbacks*@user_scores[3])+new_user_scores[3])/(@total_feedbacks+1)
    	new_physicality_score=((@total_feedbacks*@user_scores[4])+new_user_scores[4])/(@total_feedbacks+1)
    	new_mentality_score=((@total_feedbacks*@user_scores[5])+new_user_scores[5])/(@total_feedbacks+1)
    	new_solo_score=((@total_feedbacks*@user_scores[6])+new_user_scores[6])/(@total_feedbacks+1)
    	new_team_score=((@total_feedbacks*@user_scores[7])+new_user_scores[7])/(@total_feedbacks+1)
    	new_intensity_score=((@total_feedbacks*@user_scores[8])+new_user_scores[8])/(@total_feedbacks+1)

    	@user_scores=Vector[new_indoor_score,new_outdoor_score,new_cardio_score,new_strength_score,new_physicality_score,new_mentality_score,new_solo_score,new_team_score,new_intensity_score]
    	@total_feedbacks+=1

    	return @user_scores
    end

    def user_activity_similarity(activity)
    	user=@user_scores
    	activ=Vector[activity.indoor_score,activity.outdoor_score,activity.cardio_score,activity.strength_score,activity.physicality_score,activity.mentality_score,activity.solo_score,activity.team_score,activity.intensity_score]

    	numerator=user.inner_product(activ)
	 	denominator=user.r*activ.r

	 	similarity_score=(numerator/denominator)*100 #making it in range 0-100

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
