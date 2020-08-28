class ParkingLotController < ApplicationController
  layout "default"
  def show
    @domain = Domain.find_by_name(request.host)
  end

end