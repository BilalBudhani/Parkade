require 'resolv'

class DomainVerificationService
  attr_reader :host
  def initialize(host)
    @host = host
  end

  def valid?
    records.map { _1.address.to_s }.include?(server_ip)
  end

  private
  def records
    @a ||= Resolv::DNS.new.getresources(host, Resolv::DNS::Resource::IN::A)
  end

  def server_ip
    Rails.application.credentials.dig(:server_ip)
  end
end