require 'rails_helper'

RSpec.feature "Plant homescreen", type: :feature do
  scenario "User visits homepage" do
    visit "/"

    expect(page).to have_text("You don't seem to have any plants")

    click_link 'Put a seed in the dirt!'

    expect(page).to have_text('The seed has been planted!')
    expect(page).to have_text(Plant.last.height)
    expect(page).to have_text(Plant.last.water)
    expect(page).to have_text(Plant.last.fertilizer)
    expect(page).to have_text(Plant.last.sunlight)
  end
end
