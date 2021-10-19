require 'rails_helper'

RSpec.feature "Visitor adds a product to their cart", type: :feature, js: true  do
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

  scenario "They click on a product's add button" do
    # ACT
    visit root_path

    expect(page).to have_text 'My Cart (0)'

    first('article.product footer.actions form button').click

    # VERIFY
    expect(page).to have_text 'My Cart (1)'

    # DEBUG
    save_screenshot
  end
end
