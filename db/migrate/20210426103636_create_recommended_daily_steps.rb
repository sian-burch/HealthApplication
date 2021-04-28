class CreateRecommendedDailySteps < ActiveRecord::Migration[5.2]
  def change
    create_table :recommended_daily_steps do |t|
      t.integer :age, null: false
      t.integer :minimum, null: false
      t.integer :medium, null: false
      t.integer :high, null: false

      t.timestamps
    end
  end
end
