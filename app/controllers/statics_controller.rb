class StaticsController < ApplicationController
	skip_before_action :authenticate_user!
  def index
  	@pelicula = Pelicula.all
  end

  def about
  end
end
