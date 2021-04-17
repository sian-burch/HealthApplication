class RenameDurationOfActivity < ActiveRecord::Migration[5.2]
  def change
  	rename_column :activities, :duration, :duration_mins
  end
end
