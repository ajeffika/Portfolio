class ApplicationController < ActionController::Base

  before_action :set_locale

include DeviseWhitelist
include SetSource
include CurrentUserConcern
include DefaultPageContent

  def set_locale
    I18n.locale = params[:locale] || session[:locale] || I18n.default_locale
    session[:locale] = I18n.locale
      end
end



