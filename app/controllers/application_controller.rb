class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_admin
    @_current_admin ||= session[:current_admin_id] && Administrator.find_by_id(session[:current_admin_id])
  end
end
