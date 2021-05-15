class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_one :user_datum, dependent: :destroy
         has_one :user_daily_questionnaire, dependent: :destroy

         has_many :weight_diaries

end
