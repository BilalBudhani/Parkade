class DomainRestrictor

  attr_reader :internal
  def initialize(internal = true)
    @internal = internal
  end

  def matches?(request)

    if internal
      validate_base_domain(request)
    else
      validate_parked_domain(request)
    end
  end

  private
  def validate_base_domain(request)
    env = Rails.env.to_sym
    base_domain = Rails.application.credentials[env].dig(:domain)
    request.host.include?(base_domain)
  end

  def validate_parked_domain(request)
    domain = Domain.select(:id).where(name: request.host, status: "verified").first
    !domain.nil?
  end
end