class ApplicationController < ActionController::Base

  before_action :set_csrf_cookie

  inertia_share do
    shared = {
      errors: session.delete(:errors) || [],
      flash: {
        success: flash.notice,
        alert: flash.alert
      }
    }

    shared[:user] = current_user.as_json(
      only: %i[name avatar_url],
    )

    shared
  end

  private
  def set_csrf_cookie
    cookies['XSRF-TOKEN'] = form_authenticity_token
  end

end
