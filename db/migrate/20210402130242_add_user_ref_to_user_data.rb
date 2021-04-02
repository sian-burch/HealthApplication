class AddUserRefToUserData < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_data, :user, foreign_key: true
  end
end
