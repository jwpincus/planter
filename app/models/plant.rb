class Plant < ApplicationRecord

  def play(necessity)
    grow
    increment(necessity)
    decrement
  end

  def alive
    (self.water > 0) && (self.fertilizer > 0) && (self.sunlight > 0)
  end

  private

  def increment(necessity)
    self.water += 10 if necessity == 'water'
    self.fertilizer += 10 if necessity == 'fertilizer'
    self.sunlight += 10 if necessity == 'sunlight'
    save
  end

  def decrement
    self.water -= rand(1..5) + self.turn_count
    self.fertilizer -= rand(1..5) + self.turn_count
    self.sunlight -= rand(1..5) + self.turn_count
    self.turn_count += 1
    save
  end

  def grow
    self.height += [self.water, self.fertilizer, self.sunlight].min
  end

end
