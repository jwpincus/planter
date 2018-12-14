class Plant < ApplicationRecord
  belongs_to :user

  def play(necessity, double = false)
    lucky = (rand(1..6).even?)
    if double && lucky
      increment(necessity, 20)
    elsif !double
      increment(necessity, 10)
    end
    grow
    decrement
    return lucky
  end

  def alive
    (self.water > 0) && (self.fertilizer > 0) && (self.sunlight > 0)
  end

  # private

  def increment(necessity, qty = 10)
    self.water += qty if necessity == 'water'
    self.fertilizer += qty if necessity == 'fertilizer'
    self.sunlight += qty if necessity == 'sunlight'
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

  def lucky
    (rand(1..6).even?)
  end

end
