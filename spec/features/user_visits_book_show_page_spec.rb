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
        review_1 = Review.create!(user: "Jake", user_rating: 4, body: "I liked this well enough")
        review_2 = Review.create!(user: "Mike", user_rating: 3, body: "Needs more Fergie")
        review_3 = Review.create!(user: "Laura", user_rating: 4, body: "Beautiful")
        visit book_path(book)

        expect(page).to have_content(review_1.user)
        expect(page).to have_content(review_1.user_rating)
        expect(page).to have_content(review_1.body)
        expect(page).to have_content(review_2.user)
        expect(page).to have_content(review_2.user_rating)
        expect(page).to have_content(review_2.body)
        expect(page).to have_content(review_3.user)
        expect(page).to have_content(review_3.user_rating)
        expect(page).to have_content(review_3.body)
      end
    end

  end
end
