class CreateMentalPosts < ActiveRecord::Migration[5.2]
  def change
    create_table :mental_posts do |t|
      t.string :title
      t.string :description
      t.belongs_to :user, foreign_key: true

      t.timestamps
    end
  end
end
