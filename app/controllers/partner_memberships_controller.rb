class PartnerMembershipsController < ApplicationController
  before_action :check_for_cancel, only: [:create, :update, :destroy]
  respond_to :html, :js
 
  def index
    @partner_memberships = PartnerMembership.all
  end
  def new
    if @partner.nil?
      @partner_membership = PartnerMembership.new
      
    else
      @current_memberships = @partner.competencies.all
      if @current_memberships.size == 0
        @available_memberships = Competency.sorted
      else
        curr_membership_array = @current_memberships.map{ |comp_id| comp_id.id }
        @available_memberships = Competency.where.not(id: curr_membership_array)
      end
      @partner_membership = @partner.partner_memberships.build
    end
  end
  
  def create
    @partner = Partner.find(params[:partner_membership][:partner_id])
    @partner_membership = @partner.partner_memberships.build(allowed_params)
    respond_to do |format|
      if @partner_membership.save
        format.html { redirect_to(partner_path(@partner_membership.partner_id)) }
        format.js { render action: 'partners/show', status: :created, location: @partner_membership }
      end 
    end
    
  end
  
  def show
    
  end
  
  def edit
    @partner_membership = PartnerMembership.find(params[:id])
  end
  
  def update
    @partner_membership = PartnerMembership.find(params[:id])
    if @partner_membership.update_attributes(allowed_params) 
        flash[:notice] = "Partner Competency Membership was successfully updated"
        redirect_to(partner_path(@partner_membership.partner_id))
    else
        render('edit')
    end  
  end
  
  def delete
    @partner_membership = PartnerMembership.find(params[:id])
  end
  
  def destroy
    @partner_membership = PartnerMembership.find(params[:id])
    @partner = @partner_membership.partner
    @partner_membership.destroy
    flash[:notice] = "Partner membership '#{@partner_membership.competency.name}' was successfully deleted for '#{@partner_membership.partner.name}'"
    
    respond_to do |format|
      format.html { redirect_to(partner_path(@partner_membership.partner_id)) }
      format.js { render 'partners/show', status: :created, location: @partner}
    end 
  end
  

  
  private
  
  def allowed_params
    params.require(:partner_membership).permit(:partner_id, :competency_id, :num_vse, :num_vseplus, :num_vcs, :competency_level_id)
    
  end
  
  def check_for_cancel
    puts "I made it here"
    if params[:commit] == "Cancel"
      @partner_membership = PartnerMembership.find(params[:id])
      redirect_to(partner_path(@partner_membership.partner_id))
    end
  end

end
