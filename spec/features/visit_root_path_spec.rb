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

    click_link 'Water Plant'
    expect(Plant.last.water).to be > 20
    expect(Plant.last.fertilizer).to be < 20
    expect(Plant.last.sunlight).to be < 20

    Plant.last.update_attribute(:water, 0)
    visit '/' #reload to check if this backend wizrdry worked
    expect(page).to have_text("Your plant has run out of resources at a height of #{Plant.last.height}!")
  end
end
