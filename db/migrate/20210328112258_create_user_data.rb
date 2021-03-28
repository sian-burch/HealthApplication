class CreateUserData < ActiveRecord::Migration[5.2]
  def change
    create_table :user_data do |t|
      t.integer :height
      t.float :weight
      t.integer :age
      t.string :gender
      t.string :athletic_lvl
      t.boolean :physical
      t.boolean :mental
      t.integer :indoor
      t.integer :outdoor
      t.integer :meditation
      t.integer :running
      t.integer :walking
      t.integer :frequency_pref
      t.integer :duration_pref
      t.float :BMI

      t.timestamps
    end
  end
end
