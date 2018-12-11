require 'rails_helper'

RSpec.describe Plant, type: :model do
  it "starts with the correct default values" do
    plant = Plant.new
    expect(plant.height).to eq(0)
    expect(plant.water).to eq(20)
    expect(plant.fertilizer).to eq(20)
    expect(plant.sunlight).to eq(20)
  end

  it "adds water correctly and decrements fertilizer and sunlight while growing" do
    plant = Plant.create
    plant.play('water')
    expect(plant.water).to be > 20
    expect(plant.fertilizer).to be < 20
    expect(plant.sunlight).to be < 20
    expect(plant.height).to be > 0
  end

end
