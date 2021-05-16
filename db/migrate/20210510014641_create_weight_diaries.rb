class CreateWeightDiaries < ActiveRecord::Migration[5.2]
  def change
    create_table :weight_diaries do |t|
      t.float :weight
      t.date :date

      t.timestamps
    end
  end
end
