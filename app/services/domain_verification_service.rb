require 'resolv'

class DomainVerificationService
  attr_reader :host
  def initialize(host)
    @host = host
  end

  def valid?
    records.any?
  end

  private
  def records
    @a ||= Resolv::DNS.new.getresources(host, Resolv::DNS::Resource::IN::A)
  end
end