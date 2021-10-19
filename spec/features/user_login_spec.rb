require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true  do
  # SETUP
  before :each do
    @user = User.create!(
      name: 'Diego',
      last_name: 'Castro',
      email: 'diego@diego.com',
      password: 'hello12345goodbye',
      password_confirmation: 'hello12345goodbye'
    )    
  end

  scenario "They click on a product's add button" do
    # ACT
    visit '/login'

    expect(page).to have_text 'Email'
    expect(page).to have_text 'Password'

    fill_in 'email', with: 'diego@diego.com'
    fill_in 'password', with: 'hello12345goodbye'

    click_button 'Submit'


    # first('article.product footer.actions form button').click

    # VERIFY
    expect(page).to have_text 'Signed in as Diego Castro'

    # DEBUG
    save_screenshot
  end
end
