class PagesController < ApplicationController
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

end
