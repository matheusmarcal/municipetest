module Panel::V1
  class EnderecosController < PanelController
    before_action :get_municipe, :get_item
    def index; end

    def create
      @item = Endereco.new(endereco_params)
      if !@item.save!
        @error = @item.errors.first
      end
    rescue StandardError => e
      @error = e.message
    end

    def update
      if !@item.update(endereco_params)
        @error = @item.errors.first
      end
    rescue StandardError => e
      @error = e.message
    end

    private
    def get_municipe
      @municipe = Municipe.find(params[:municipe_id])
    end

    def get_item
      if params[:id].present?
        @item = Endereco.find(params[:id])
      else
        @item = Endereco.new
      end
    end

    def endereco_params
      params.require(:endereco).permit(:municipe_id, :cep, :logradouro, :bairro, :cidade, :uf, :complemento, :codigo_ibge)
    end
  end
end
