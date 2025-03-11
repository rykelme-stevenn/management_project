class UsersController < ApplicationController
    before_action :set_user, only: [:show, :update, :destroy]
    before_action :set_franchise
    before_action :authenticate_request, only: [:index, :show]
    # GET /users
    def index
      @users = @franchise.users
      if params[:search].present?
        search_term = "%#{params[:search]}%"
        @users = @users.where("name ILIKE ? OR email ILIKE ?", search_term, search_term)
      end
      render json: @users
    end
  
    # GET /users/1
    def show
      render json: @user
    end
  
    # POST /users
    def create
      @user = User.new(user_params)
      if @user.save
        render json: @user, status: :created
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /users/1
    def update
      if @user.update(user_params)
        render json: @user
      else
        render json: @user.errors, status: :unprocessable_entity
      end
    end
  
    # DELETE /users/1
    def destroy
      @user.destroy
      head :no_content
    end

    # def users_poistion
        
    # end
  
    private
  
    def set_user
      @user = User.find(params[:id])
    end
    
    def set_franchise
      @franchise = Franchise.find_by!(id: params[:franchise_id])
    end

    def user_params
      params.require(:user).permit(:name, :email, :password)
    end
  end