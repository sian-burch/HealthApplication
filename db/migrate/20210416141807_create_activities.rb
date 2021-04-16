class CreateActivities < ActiveRecord::Migration[5.2]
  def change
    create_table :activities do |t|
      t.string :name, null: false
      t.integer :duration, null: false, default: 0
      t.integer :indoor_score, null: false, default: 0
      t.integer :outdoor_score, null: false, default: 0
      t.integer :cardio_score, null: false, default: 0
      t.integer :strength_score, null: false, default: 0
      t.integer :physicality_score, null: false, default: 0
      t.integer :mentality_score, null: false, default: 0
      t.integer :solo_score, null: false, default: 0
      t.integer :team_score, null: false, default: 0
      t.integer :intensity_score, null: false, default: 0

      t.timestamps
    end
  end
end
