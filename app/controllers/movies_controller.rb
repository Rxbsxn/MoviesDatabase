class MoviesController < ApplicationController
  def index
    @q = Movie.ransack(params[:q])
    @movies  = @q.result(distinct: true)
  end

  def new
    @movie = Movie.new
  end

  def create
    @movie = Movie.create(movie_params)
    if @movie.save
      redirect_to movies_path
    else
      render :new
    end
  end
  
  def edit
    movie
  end

  def update
    movie
    if movie.update(movie_params)
      redirect_to movies_path
    else
      render :edit
    end
  end

  def destroy
    movie
    if movie.destroy
      redirect_to movies_path
    else
      render :index
    end
  end

  private

  def movie_params
    params.require(:movie).permit(:name, :revenue, :genre_id)
  end

  def movie
    @movie = Movie.find(params[:id])
  end
end
