class ActorsController < ApplicationController
  def index
    @actors = Actor.all
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.create(actor_params)
    if @actor.save
      redirect_to actors_path
    else
      render :new
    end
  end

  def edit
    actor
  end

  def update
    actor
    if actor.update(actor_params)
      redirect_to actors_path
    else
      render :edit
    end
  end

  def destroy
    actor
    if actor.destroy
      redirect_to actors_path
    else
      render :index
    end 
  end 
  
  private

  def actor
    @actor = Actor.find(params[:id])
  end

  def actor_params
    params.require(:actor).permit(:first_name, :last_name, movie_ids: [])
  end
end
