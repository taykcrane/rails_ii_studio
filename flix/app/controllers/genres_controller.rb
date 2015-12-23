class GenresController < ApplicationController
	before_action :require_admin, only: [:create]

	def index
		@genre = Genre.new
		@genres = Genre.all
	end

	def show
		@genre = Genre.find(params[:id])
		@movies = @genre.movies
	end

	def create
		@genre = Genre.new(genre_params)
		if @genre.save
			redirect_to genres_path, notice: "A genre has been added!"
		else
			redirect_to genres_path, alert: "Please add a valid genre."
		end
	end

	private
	def genre_params
		params.require(:genre).permit(:name)
	end
end
