class CreateIndexUserDatumId < ActiveRecord::Migration[5.2]
  def change
    add_index :user_daily_questionnaires, :user_datum_id
  end
end
