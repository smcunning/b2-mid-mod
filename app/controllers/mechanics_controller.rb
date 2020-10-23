class MechanicsController < ApplicationController

  def index
    @mechanics = Mechanic.all
  end

  def show
    @mechanic = Mechanic.find(params[:id])
    if params[:add_ride]
      add_ride = Ride.find(params[:add_ride])
      @mechanic.rides << add_ride
      redirect_to "/mechanics/#{@mechanic.id}"
    end
  end
end
