class PeliculasController < ApplicationController
  before_action :set_pelicula, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

   def index
    @pelicula = Pelicula.all    
   end
   
   def show
   	@pelicula = Pelicula.find(params[:id])
    @Comment = Comment.where(pelicula_id: @pelicula).order("created_at DESC")
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
      #Use callbacks to share common setup or constraints between actions.
      def set_pelicula
      @pelicula = Pelicula.find(params[:id])
      end

      #Never trust parameters from the scary internet, only allow the white list through.
      def pelicula_params
      params.require(:pelicula).permit(:name, :rating, :main_actor, :Synopsis, :launching, :image)
      #parametres que nossaltres permetem que rails guardi la informació
      end
end
