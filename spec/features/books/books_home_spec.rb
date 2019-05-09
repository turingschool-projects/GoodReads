require "rails_helper"

describe "user sees all books" do
  describe "they visit /books" do

    it "gives error if no books" do
      visit books_path

      expect(page).to have_content("No books!")
    end

    it "displays all books if books" do
      astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year: 2013, cover_url: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
      css = Book.create(title: 'CSSucks', pages: 420, year: 2019, cover_url: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')

      astronaut.authors << Author.find_or_create_by(name: 'Chris Hadfield')
      css.authors << Author.find_or_create_by(name: 'Matt Weiss')

      visit books_path

      expect(page).to have_link(astronaut.title)
      expect(page).to have_link(css.title)
      expect(page).to have_content(astronaut.pages)
      expect(page).to have_content(css.pages)
      expect(page).to have_content(astronaut.year)
      expect(page).to have_content(css.year)
      expect(page).to have_content(astronaut.authors[0].name)
      expect(page).to have_content(css.authors[0].name)
      expect(page).to have_xpath("//img[contains(@src,'#{astronaut.cover_url}')]")
      expect(page).to have_xpath("//img[contains(@src,'#{css.cover_url}')]")
    end

    it "displays a button that directs to a new book creation page" do
      astronaut = Book.create(title: "An Astronaut's Guide to Life on Earth", pages: 284, year: 2013, cover_url: 'http://media.npr.org/assets/bakertaylor/covers/a/an-astronauts-guide-to-life-on-earth/9780316253017_custom-72b5b1e3d259fb604fee1401424db3c8cd04cfe0-s6-c30.jpg')
      css = Book.create(title: 'CSSucks', pages: 420, year: 2019, cover_url: 'https://i1.wp.com/www.developermemes.com/wp-content/uploads/2014/01/CSS-Sucks-TShirt-Meme.jpg?resize=385%2C232')

      astronaut.authors << Author.find_or_create_by(name: 'Chris Hadfield')
      css.authors << Author.find_or_create_by(name: 'Matt Weiss')

      visit books_path

      expect(page).to have_link("New Book")

      click_link("New Book")

      expect(current_path).to eq('books/new')

    end
  end
end
