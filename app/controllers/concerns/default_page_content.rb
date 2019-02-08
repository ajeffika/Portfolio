module DefaultPageContent
  extend ActiveSupport::Concern

  included do
    before_action :set_page_defaults
  end

  def set_page_defaults
    @page_title = t('portfolio_title')
    @seo_keywords = 'Jan Mistarz portfolio'
  end


  end
