class ApplicationController < ActionController::Base

  before_action :set_csrf_cookie

  inertia_share do
    {
      errors: session.delete(:errors) || [],
      flash: {
        success: flash.notice,
        alert: flash.alert
      },
      user: {
        name: current_user.name,
        avatar_url: current_user.avatar_url
      }
    }
  end

  private
  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token
  end

end
