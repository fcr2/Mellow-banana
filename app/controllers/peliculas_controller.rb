class PeliculasController < ApplicationController
  before_action :find_pelicula, only: [:show, :edit, :update; :destroy] 
   def index

    @pelicula = Pelicula.all    
   end
   
   def show
   	@pelicula = Pelicula.find(params[:id])
   end
   
   def new
   	@pelicula = Pelicula.new 
   end
   
   def create    
   	@pelicula = Pelicula.new(pelicula_params)
     
   		if @pelicula.save
   			redirect_to peliculas_path, notice: "film saved!"
    	else
    		render "new"
    	end

   end
   
   def edit
    @pelicula = Pelicula.find(params[:id])
   end
   
   def update
    @pelicula = Pelicula.find(params[:id])      

      if @pelicula.update_attributes(pelicula_params)
        redirect_to peliculas_path, notice: "success!"
      else 
        render :edit
      end
   end
   
   def destroy
    @pelicula = Pelicula.find(params[:id])
    @pelicula.destroy
        redirect_to peliculas_path, notice: "film deleted!"
   end

   private
      def pelicula_params
      params.require(:pelicula).permit(:name, :rating, :main_actor, :Synopsis, :launching, :image, :body)
      #parametres que nossaltres permetem que rails guardi la informació
      end

      def find_pelicula
        @pelicula = Pelicula.find(params[:id])
end
