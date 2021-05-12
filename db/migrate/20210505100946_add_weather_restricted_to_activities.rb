class AddWeatherRestrictedToActivities < ActiveRecord::Migration[5.2]
  def change
    add_column :activities, :weather_restricted, :boolean
  end
end
