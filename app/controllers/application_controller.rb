class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_locale
  before_action :cors_set_access_control_headers

  protected

  def set_locale
    domain = request.host.split('.').last
    if domain == "cymru"
      I18n.locale = :cy
    else
      I18n.locale = :en
    end
  end

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Max-Age'] = "1728000"
  end

end
