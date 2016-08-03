class ApplicationController < ActionController::Base
  protect_from_forgery

  before_action :set_locale

  protected

  def set_locale
    domain = request.host.split('.').last
    if domain == "cymru"
      I18n.locale = :cy
    else
      I18n.locale = :en
    end
  end

end
