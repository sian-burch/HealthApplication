class CreateUserData < ActiveRecord::Migration[5.2]
  def change
    create_table :user_data do |t|
      t.integer :height, null: false
      t.float :weight, null: false
      t.integer :age, null: false
      t.string :gender, null: false
      t.string :athletic_lvl, null: false
      t.boolean :physical, null: false
      t.boolean :mental, null: false
      t.integer :indoor, null: false
      t.integer :outdoor, null: false
      t.integer :meditation, null: false
      t.integer :running, null: false
      t.integer :walking, null: false
      t.integer :frequency_pref, null: false
      t.integer :duration_pref, null: false
      t.float :BMI

      t.timestamps
    end
  end
end
