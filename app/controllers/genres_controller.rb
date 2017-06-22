class GenresController < ApplicationController
  def index
    @genres = Genre.all
  end

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create(genre_params)
    if @genre.save
      redirect_to genres_path
    else 
      render :new
    end
  end

  def edit
    genre
  end

  def update
    genre
    if genre.update(genre_params)
      redirect_to genres_path
    else
      render :edit
    end
  end

  def destroy
    genre
    if genre.destroy
      redirect_to genres_path
    else
      render :index
    end
  end

  private

  def genre
    @genre = Genre.find(params[:id])        
  end

  def genre_params
    params.require(:genre).permit(:name)
  end
end
