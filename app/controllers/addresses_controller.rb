class AddressesController < ApplicationController
    before_action :set_address, only: [:show, :update, :destroy]
    before_action :authenticate_request, only: [:index, :show]
  
    # GET /addresses
    def index
      @addresses = @franchise.addresses
      render json: @addresses
    end
  
    # GET /addresses/1
    def show
      render json: @address
    end
  
    # POST /addresses
    def create
      @address = Address.new(address_params)
  
      if @address.save
        render json: @address, status: :created
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /addresses/1
    def update
      if @address.update(address_params)
        render json: @address
      else
        render json: @address.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /addresses/1
    def destroy
      @address.destroy
      head :no_content
    end
  
    private
  
    def set_address
      @address = Address.find(params[:id])
    end
  
    def address_params
      params.require(:address).permit(:cep, :street, :number, :complement, :neighborhood, :city, :state, :postal_code)
    end
  end
  