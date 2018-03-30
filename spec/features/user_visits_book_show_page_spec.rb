require 'rails_helper'

describe 'As a user' do
  describe 'when I visit /books/:id' do
    it 'I see the book title' do
      book = Book.create!(title: "Great Gatsby")
      visit book_path(book)

      expect(page).to have_content(book.title)
    end

    describe 'I see a list of reviews for that book' do
    end

  end
end
