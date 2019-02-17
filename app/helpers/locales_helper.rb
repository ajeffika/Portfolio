module LocalesHelper
    def locales_changer (style = '', tag_type='')
      locales_btns= ''
      if I18n.locale == I18n.default_locale
        locales_btns<< "<#{tag_type}> #{link_to "English", { locale:'en' }, class: style}</#{tag_type}>"
      else
        locales_btns<< "<#{tag_type}> #{link_to "Polski", { locale:'pl' }, class: style}</#{tag_type}>"
      end
      locales_btns.html_safe
  end
end

