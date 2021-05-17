class MentalPost < ApplicationRecord
  belongs_to :user
  validates :title, :description, presence: true
end
