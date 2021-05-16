class AddUserIdToWeightDiaries < ActiveRecord::Migration[5.2]
  def change
    add_column :weight_diaries, :user_id, :integer
    add_index :weight_diaries, :user_id
  end
end
