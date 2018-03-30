class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.string :user_rating
      t.string :body
      t.references :user, foreign_key: true
      t.references :book, foreign_key: true
    end
  end
end
