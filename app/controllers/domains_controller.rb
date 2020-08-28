class DomainsController < ApplicationController

  before_action :authenticate_user!, except: [:gatekeeper]

  def new
    render inertia: "Domains/New"
  end

  def create
    domain = Domain.new domain_params
    domain.status = "pending"
    domain.user = current_user
    if domain.save
      redirect_to setup_domain_path(domain), notice: "Domain added successfully"
    else
      session[:errors] = domain.errors
      redirect_to new_domain_path, alert: "Something went wrong"
    end
  end

  def setup
    domain = Domain.find(params[:id])
    render inertia: "Domains/Setup", props: {
      domain: domain
    }
  end

  def verify
    domain = Domain.find(params[:id])
    verification_service = DomainVerificationService.new(domain.name)
    valid = verification_service.valid?

    if valid
      domain.status = 'verified'
      domain.dns_linked = true
      domain.save
    end

    render inertia: "Domains/Setup", props: {
      domain: domain,
      valid: valid
     }
  end

  def gatekeeper
    domain = Domain.select(:id).where(name: params[:domain], status: "verified").first
    if domain
      head :ok
    else
      head :not_ok
    end
  end

  private
  def domain_params
    params.require(:domain).permit(:name, :title, :description, :head_scripts, :footer_scripts)
  end
end