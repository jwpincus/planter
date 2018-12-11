require 'rails_helper'

RSpec.feature "Plant homescreen", type: :feature do
  scenario "User visits homepage" do
    visit "/"

    expect(page).to have_text("You don't seem to have any plants")
  end
end
