class User < ApplicationRecord
 
  # Validates Devise password to reach certain complexity
  # Can be commented out in development phase
  validate :password_complexity
  # validates :terms_and_agreements, acceptance: { accept: true }
  validates :terms_and_agreements, acceptance: true

  def password_complexity
    # Regexp extracted from https://stackoverflow.com/questions/19605150/regex-for-password-must-contain-at-least-eight-characters-at-least-one-number-a
    return if password.blank? || password =~ /(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-])/

    errors.add :password, 'Complexity requirement not met. Please use: 1 uppercase, 1 lowercase, 1 digit and 1 special character'
  end
 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

has_one :user_datum, dependent: :destroy
has_one :user_daily_questionnaire, dependent: :destroy

end
