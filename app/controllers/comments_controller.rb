class CommentsController < ApplicationController
	def create
		@pelicula = Pelicula.find(params[:pelicula_id])
		@comment = @pelicula.comment.create(params[:comment].permit(:name, :body))
		redirect_to pelicula_path(@pelicula)
	end
end
