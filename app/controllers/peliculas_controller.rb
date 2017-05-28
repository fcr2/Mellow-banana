class PeliculasController < ApplicationController
   def index
   	# muestra las películas que hay en la base de datos.. ya está...esto es todo
    # lo que hace el index
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
   			redirect_to peliculas_path, notice: "Se ha guardado la peli!"
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
        redirect_to peliculas_path, notice: "éxito!"
      else 
        render :edit
      end
   end
   
   def destroy
    @pelicula = Pelicula.find(params[:id])
    @pelicula.destroy
        redirect_to peliculas_path, notice: "Se ha eliminado la peli!"
   end

   private
      def pelicula_params
      params.require(:pelicula).permit(:name, :stars, :main_actor, :year)
      #parametres que nossaltres permetem que rails guardi la informació
      end
end
