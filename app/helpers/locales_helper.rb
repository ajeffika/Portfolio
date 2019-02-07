module LocalesHelper
    def locales_changer style = ''
      if I18n.locale == I18n.default_locale
        link_to "English", { locale:'en' }, class: style

      else
        link_to "Polski", { locale:'pl' }, class: style

      end
  end
end

