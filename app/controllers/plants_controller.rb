class PlantsController < ApplicationController
  before_action :set_user

  def index
    @high_score = high_score
    @plant = Plant.find_by_id(session[:plant_id])
    @plant_count = @user.plants.count
  end

  def create
    plant = @user.plants.create
    session[:plant_id] = plant.id
    redirect_to root_path
  end

  def update
    plant = Plant.find_by_id(params[:id])
    plant.play(params[:play], params[:double])
    plant.height > high_score ? session[:high_score] = plant.height : nil
    redirect_to root_path
  end

  private

  def high_score
    session[:high_score] || 0
  end

  def set_user
    session[:user_id] ? @user = User.find(session[:user_id]) : create_user
  end

  def create_user
    @user = User.create
    session[:user_id] = @user.id
  end

end
