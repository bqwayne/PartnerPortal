class CompetencyLevelsController < ApplicationController
  def index
    @competency_levels = CompetencyLevel.all
  end

  def show
    @competency_level = CompetencyLevel.find(params[:id])
  end

  def new
    @competency_level = CompetencyLevel.new
  end

  def create
    @competency_level = CompetencyLevel.new(allowed_params)
    if @competency_level.save
      flash[:notice] = "Competency Level added"
      redirect_to(competency_levels_path)
    else
      render('new')
    end
  end
  
  def edit
    @competency_level = CompetencyLevel.find(params[:id])
  end

  def update
    @competency_level = CompetencyLevel.find(params[:id])
    if @competency_level.update_attributes(allowed_params)
      flash[:notice] = "Competency Level updated successfully"
      redirect_to(competency_level_path(:id))
    else
      render('edit')
    end
  end
  
  private
  
  def allowed_params
    params.require(:competency_level).permit(:name, :description)
  end
end
