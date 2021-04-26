# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Activity.create(name: 'Running',duration_mins: 30,indoor_score: 2, outdoor_score: 4,cardio_score: 5, strength_score: 0, physicality_score: 5,mentality_score: 2,solo_score: 5,team_score: 4,intensity_score: 4)
Activity.create(name: 'Walking',duration_mins: 30,indoor_score: 2, outdoor_score: 4,cardio_score: 3, strength_score: 0, physicality_score: 5,mentality_score: 1,solo_score: 5,team_score: 4,intensity_score: 1)
Activity.create(name: 'Meditation',duration_mins: 15,indoor_score: 5, outdoor_score: 5,cardio_score: 0, strength_score: 0, physicality_score: 0,mentality_score: 5,solo_score: 5,team_score: 3,intensity_score: 0)

for i in 4..6
	AgeGroup.create(age: i,age_group: 1)
end
for i in 7..11
	AgeGroup.create(age: i,age_group: 2)
end
for i in 12..19
	AgeGroup.create(age: i,age_group: 3)
end
for i in 20..65
	AgeGroup.create(age: i,age_group: 4)
end
for i in 66..120
	AgeGroup.create(age: i,age_group: 5)
end
#create seeds for user and user data