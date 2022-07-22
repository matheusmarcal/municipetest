module Panel::V1
  class PanelController < ActionController::Base
    layout "panel"

    def per_page
      params[:per] || 10
    end

    def page
      params[:page] || 1
    end
  end
end
