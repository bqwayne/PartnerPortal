class PartnerLevelsController < ApplicationController
  def index
    @partner_levels = PartnerLevel.all
  end

  def show
    @partner_level = PartnerLevel.find(params[:id])
  end

  def new
    @partner_level = PartnerLevel.new
  end

  def create
    @partner_level = PartnerLevel.new(allowed_params)
    if @partner_level.save 
      flash[:notice] = "Partner Level added"
      redirect_to(partner_levels_path)
    else
      render('new')
    end
  end
  
  def edit
    @partner_level = PartnerLevel.find(params[:id])
  end

  def update
    @partner_level = PartnerLevel.find(params[:id])
    if @partner_level.update_attributes(allowed_params)
      flash[:notice] = "Partner Level updated successfully"
      redirect_to(partner_level_path(:id))
    else
      render('edit')
    end
  end
  
  private
  
  def allowed_params
    params.require(:partner_level).permit(:name)
  end
end
