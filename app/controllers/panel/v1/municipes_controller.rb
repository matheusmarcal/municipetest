module Panel::V1
  class MunicipesController < PanelController
    before_action :get_item
    def index; end

    def edit; end

    def update
      if !@item.update(municipe_params)
        @error = @item.errors.first
      end
    rescue StandardError => e
      @error = e.message
    end

    def create
      begin
        @item = Municipe.new(municipe_params)
        if !@item.save!
          @error = @item.errors.first
        end
      rescue StandardError => e
        @error = e.message
      end
    end

    private

    def get_item
      if params[:id].present?
        @item = Municipe.find(params[:id])
      else
        @item = Municipe.new
        @items = Municipe.order(created_at: :desc)
        @items = @items.where("#{params[:type].to_s} ILIKE ?", "%#{params[:data]}%") if params[:data].present?
        @items = @items.page(page).per(per_page)
      end
    end

    def municipe_params
      params.require(:municipe).permit(:nome_completo, :cpf, :cns, :email, :data_de_nascimento, :telefone, :foto, :status)
    end
  end
end
