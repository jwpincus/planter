class Plant < ApplicationRecord

  def add(necessity)
    self.water += 10 if necessity == 'water'
    self.fertilizer += 10 if necessity == 'fertilizer'
    self.sunlight += 10 if necessity == 'sunlight'
    decrement
    save
  end

  def decrement
    self.water -= rand(1..5) + self.turn_count
    self.fertilizer -= rand(1..5) + self.turn_count
    self.sunlight -= rand(1..5) + self.turn_count
    self.turn_count += 1
    save
  end

end
