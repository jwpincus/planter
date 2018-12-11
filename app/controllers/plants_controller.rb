class PlantsController < ApplicationController

  def index
    @plant = Plant.find_by_id(session[:plant_id])
  end

  def create
    plant = Plant.create
    session[:plant_id] = plant.id
    redirect_to root_path
  end

end
