class StaticsController < ApplicationController
  def index
  	@pelicula = Pelicula.all
  end

  def about
  end
end
