class CompetenciesController < ApplicationController
  def index
    @competencies = Competency.sorted
  end

  def show
    @competency = Competency.find(params["id"])
  end
  
  def new
    @competency = Competency.new
  end
  
  def create
    @competency = Competency.new(allowed_params)
    if @competency.save
      flash[:notice] = "Competency was successfully added"
      redirect_to(competencies_path)
    else
      flash[:notice] = "Competency was not successfully updated"
      render('new')
    end
  end

  def edit
    @competency = Competency.find(params["id"])
  end
  
  def update
     @competency = Competency.find(params["id"])
    
    if @competency.update_attributes(allowed_params)
      flash[:notice] = "Competency was successfully updated"
      redirect_to(competency_path(@competency))
    else
      flash[:notice] = "Competency was not successfully updated"
      render('edit')
    end  
  end

  def delete
  end
  
  def destroy
    
  end
  
  private
  def allowed_params
    params.require(:competency).permit(:name, :description, :competency_type_id)
  end
end
