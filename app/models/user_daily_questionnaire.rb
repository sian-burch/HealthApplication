class UserDailyQuestionnaire < ApplicationRecord

    has_and_belongs_to_many :user_data
    scope :my_questionnaires, ->(user_data) {where(['user_datum_id = ?', user_data.ids.first.to_s])}

end
