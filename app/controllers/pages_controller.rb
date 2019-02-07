class PagesController < ApplicationController
  before_action :set_locale
  layout :resolve_layout
  def home
    @posts = Blog.all
    @skills = Skill.all
  end

  def about
    @skills = Skill.all
  end

  def contact
  end

  def tech_news
    @tweets=SocialTool.twitter_search
  end
  def resolve_layout
    case action_name
    when "home"
      "application"
    else
      "pages"
    end
  end

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ?
                      locale :
                      I18n.default_locale
  end
end
