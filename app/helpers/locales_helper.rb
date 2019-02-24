module LocalesHelper
    def locales_changer (style = '', tag_type='')
      locales_btns= ''
      if I18n.locale == I18n.default_locale
        locales_btns<< "<#{tag_type}> #{link_to ' ', { locale:'en' }, class: 'flag-icon flag-icon-gb nav-icon '+ style}</#{tag_type}>"
      else
        locales_btns<< "<#{tag_type}> #{link_to ' ', { locale:'pl' }, class: 'flag-icon flag-icon-pl nav-icon '+ style}</#{tag_type}>"
      end
      locales_btns.html_safe
  end
end

def Language(icon_name, text, link)
  link_to content_tag(:span,' ', class:  "fa fa-#{icon_name} nav-link git-icon"), link
end