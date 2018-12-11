class PlantsController < ApplicationController

  def index
    @high_score = high_score
    @plant = Plant.find_by_id(session[:plant_id])
  end

  def create
    plant = Plant.create
    session[:plant_id] = plant.id
    redirect_to root_path
  end

  def update
    plant = Plant.find_by_id(params[:id])
    plant.play(params[:play])
    plant.height > high_score ? session[:high_score] = plant.height : nil

    redirect_to root_path
  end

  private

  def high_score
    session[:high_score] || 0
  end

end
