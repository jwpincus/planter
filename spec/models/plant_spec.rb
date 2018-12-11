require 'rails_helper'

RSpec.describe Plant, type: :model do
  it "starts with the correct default values" do
    plant = Plant.new
    expect(plant.height).to eq(0)
    expect(plant.water).to eq(20)
    expect(plant.fertilizer).to eq(20)
    expect(plant.sunlight).to eq(20)
  end
end
