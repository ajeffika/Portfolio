module ApplicationHelper

  def login_helper(style='',tag_type='')
    login_btns= ''
    if current_user.is_a?(GuestUser)

      login_btns<< "<#{tag_type}>#{(link_to t('register'), new_user_registration_path, class: style)}</#{tag_type}>
        <#{tag_type}> #{(link_to t('login'), new_user_session_path, class: style)}</#{tag_type}>"
    else
      login_btns << "<#{tag_type}> #{link_to t('logout'), destroy_user_session_path, method: :delete, class: style}
</#{tag_type}>"
    end
    login_btns.html_safe
  end


  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{link_to 'contact me',contact_path} if You'd like to work together."
      content_tag(:p, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    @copyright = ViewTool::Renderer.copyright('Jan Mistarz', 'All Rights reserved')
  end

  def nav_items
    [
      {
         url: root_path,
         title: t('home')
      },

      {
         url: about_me_path,
         title: t('about_me')
      },

      {
         url: contact_path,
         title: t('contact')
      },

      {
         url: portfolios_path,
         title: t('portfolios')
      },
      {
          url: tech_news_path,
          title: t('tech_news')
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''
    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style}
        #{active? item[:url]}'> #{item[:title]}</a></#{tag_type}>"
    end
      nav_links.html_safe
  end



  def active? path
    "active" if current_page? path
  end

  def alerts
    alert=(flash[:alert] || flash[:error] || flash[:notice])
    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: 'Jeffik', sticky: false)
  end

  def link_fa_to(icon_name, text, link)
    link_to content_tag(:span,' ', class:  "fa fa-#{icon_name} nav-link nav-icon"), link
  end


  private
end