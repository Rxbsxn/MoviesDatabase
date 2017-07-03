class AwardsController < ApplicationController
  def index
    @q = Award.ransack(params[:q])
    @awards = @q.result(distinct: true)
  end

  def new
    @award = Award.new
  end

  def create
    @award = Award.create(award_params)
    if @award.save
      redirect_to awards_path
    else
      render :new
    end
  end

  def edit
    award
  end

  def update
    award
    if award.update(award_params)
      redirect_to awards_path
    else
      render :edit
    end
  end

  def destroy
    award
    if award.destroy
      redirect_to awards_path
    else
      render :index
    end
  end

  private

  def award
    @award = Award.find(params[:id])
  end

  def award_params
    params.require(:award).permit(:actor_id, :movie_id, :award_type, :role, :year)
  end
end
