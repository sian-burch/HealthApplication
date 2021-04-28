class RemoveDefaultValueOfDurationFromActivity < ActiveRecord::Migration[5.2]
  def change
  	change_column_default :activities, :duration, nil
  end
end
