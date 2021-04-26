class CreateAgeGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :age_groups do |t|
      t.integer :age, null: false
      t.integer :age_group,null: false

      t.timestamps
    end
  end
end
