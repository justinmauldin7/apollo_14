class AstronautsController < ApplicationController

  def index
    @astronaut = Astronaut.find(params[:id])
  end

end
