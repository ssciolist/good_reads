require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /books/:id' do
    it 'I see the book title' do
      book = Book.create!(title: "Great Gatsby")
      visit book_path(book)

      expect(page).to have_content(book.title)
    end

    describe 'I see a list of reviews for that book' do
      it 'each review has user, review body and rating' do
        book = Book.create!(title: "Great Gatsby")
        user_1 = User.create!(name: "Jake")
        user_2 = User.create!(name: "Mike")
        user_3 = User.create!(name: "Laura")
        review_1 = book.reviews.create!(user_rating: 4, body: "I liked this well enough", user_id: user_1.id)
        review_2 = book.reviews.create!(user_rating: 3, body: "Needs more Fergie", user_id: user_2.id)
        review_3 = book.reviews.create!(user_rating: 4, body: "Beautiful", user_id: user_3.id)

        visit book_path(book)

        expect(page).to have_content(user_1.id)
        expect(page).to have_content(review_1.user_rating)
        expect(page).to have_content(review_1.body)
        expect(page).to have_content(user_2.id)
        expect(page).to have_content(review_2.user_rating)
        expect(page).to have_content(review_2.body)
        expect(page).to have_content(user_3.id)
        expect(page).to have_content(review_3.user_rating)
        expect(page).to have_content(review_3.body)
      end
    end

  end
end
