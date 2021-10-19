require 'rails_helper'

RSpec.feature "Visitor navigates to product details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(word_count: 3),
        description: Faker::Hipster.paragraph(sentence_count: 4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They click on a product name" do
    # ACT
    visit root_path
    # Display full html
    # puts page.html
    first('article.product header h4').click
    # first('Details &raquo;').click

    # VERIFY
    expect(page).to have_css 'section.products-show'

    # DEBUG
    # save_screenshot
  end

  scenario "They click on a product's Details button" do
    # ACT
    visit root_path
    # Display full html
    # puts page.html
    first('article.product footer.actions a').click
    # first('Details &raquo;').click

    # VERIFY
    expect(page).to have_css 'section.products-show'
    
    # DEBUG
    save_screenshot
  end
end