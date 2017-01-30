class PartnersController < ApplicationController
  #layout false
  
  def index
    @partners = Partner.sorted
  end

  def show
    @partner = Partner.find(params["id"])
  end

  def edit
    @partner = Partner.find(params["id"])
    @partner_levels = PartnerLevel.all
    
  end
  
  def new
    @partner = Partner.new
    @all_competencies = Competency.sorted
    @partner_memberships = @partner.partner_memberships.build
    @partner_levels = PartnerLevel.all
    
  end
  
  def create
    @partner = Partner.new(allowed_params)
    
    params[:competencies][:id].each do |comps|
      if !comps.empty?
        @partner.partner_memberships.build(:competency_id => comps)
      end
    end
    
    if @partner.save
      flash[:notice] = "Partner was successfully added"
      redirect_to(partners_path)
    else
      render('new')
    end
  end
  
  def update
    flash[:notice] = ''
    @partner = Partner.find(params[:id])
    edit_type = params[:edit_type]
    if edit_type == "Edit Partner"
      if @partner.update_attributes(allowed_params) 
        flash[:notice] = "Partner was successfully updated && Edit Type was #{edit_type}"
        redirect_to(partner_path(@partner))
      else
        render('edit')
      end  
    elsif edit_type == "Add Partner"
      @partner_membership = @partner.partner_memberships.build(allowed_partern_membership_params)
      if @partner.save
        respond_to do |format|
          format.html { redirect_to(partner_path(@partner)) }
          format.js { render action: 'show', status: :created, location: @partner_membership } 
        end
      end
    end
  end

  def delete
    @partner = Partner.find(params["id"])
  end
  
  def destroy
    @partner = Partner.find(params["id"])
    @partner.destroy
    flash[:notice] = "Partner '#{@partner.name}'was successfully deleted"
    redirect_to(partners_path)    
  end
  
  def add_memberships
    @partner = Partner.find(params['id'])
    @curr_memberships = PartnerMembership.where(partner_id: @partner.id)
    @new_memberships = @partner.partner_memberships.build
    if @curr_memberships.size == 0
      @available_memberships = Competency.sorted
    else
      curr_membership_array = @curr_memberships.map{ |comp_id| comp_id.competency_id }
      @available_memberships = Competency.where.not(id: curr_membership_array)
    end
    
    respond_to do |format|
      format.html
      format.js 
    end
  end
  
  private 
  def allowed_params
    params.require(:partner).permit(:id, :name, :pnet_acct, :partner_membership, partner_membership: [:competency_id, :competency_level_id, :num_vse, :num_vseplus, :num_vcs])
  end
  
  def allowed_partern_membership_params
    params.require(:partner_membership).permit(:competency_id, :competency_level_id, :num_vse, :num_vseplus, :num_vcs)
  end
  
  
end