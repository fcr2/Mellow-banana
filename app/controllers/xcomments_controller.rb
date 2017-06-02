class CommentsController < ApplicationController
	before_action :find_pelicula
	before_action :find_comment, only: [:destroy, :edit, :update, :comment_owner]
	before_action :comment_owner, only: [:destroy,:edit, :update]

	def create
		@comment = @pelicula.comments.create(params[:comment].permit(:content))
		@comment.user_id = current_user.user_id
		@comment.save

		if @comment.save
			redirect_to pelicula_path(@pelicula)
		else
			render 'new'
		end
	end

	def destroy
	  @comment.destroy
		redirect_to pelicula_path(@pelicula)
	end

	def edit
	  )
	end

	def update
	  if @comment.update(params[:comment].permit(:content))
		redirect_to pelicula_path(@pelicula)
	  else
		render 'edit'
	  end
	end


	private

	def find_pelicula
		@pelicula = Pelicula.find(params[:pelicula_id])
	end

	def find_comment
		@comment = @pelicula.comments.find(params[:id])
	end

	def comment_owner
		unless current_user.id == @comment.user_id
			flash[:notice] = "You shall not pass!"
			redirect_to @pelicula
		end		
	end


end
