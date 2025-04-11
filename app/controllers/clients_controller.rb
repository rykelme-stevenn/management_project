class ClientsController < ApplicationController
    before_action :set_client, only: [:show, :update, :destroy]
    before_action :set_franchise
    before_action :authenticate_request, only: [:index, :show]
  
    # GET /clients
    def index
      @clients = @franchise.clients
      if params[:search].present?
        search_term = "%#{params[:search]}%"
        @clients = @clients.where("name ILIKE ? OR email ILIKE ?", search_term, search_term)
      end
      render json: @clients
    end
  
    # GET /clients/1
    def show
      render json: @client
    end
  
    # POST /clients
    def create
      if Client.exists?(cpf: client_params[:cpf], franchise: @franchise)
        render json: { error: "Cliente com este CPF já existe na franquia" }, status: :unprocessable_entity
        return
      end
    
      @client = Client.new(client_params)
      @client.franchise = @franchise 
    
      if @client.save
        render json: @client, status: :created
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end
    
  
    # PATCH/PUT /clients/1
    def update
      if @client.update(client_params)
        render json: @client
      else
        render json: @client.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /clients/1
    def destroy
      @client.destroy
      head :no_content
    end
  
    private
  
    def set_client
      @client = Client.find(params[:id])
    end
  
    def set_franchise
      @franchise = Franchise.find_by!(id: params[:franchise_id])
    end
  
    def client_params
        params.require(:client).permit(
          :name,
          :cpf,
          :birth_date,
          :observation,
          :tel_main,
          :tel_sec,
          :email,
          :address_id,
          :work_address_id
        )
      end
  end
  