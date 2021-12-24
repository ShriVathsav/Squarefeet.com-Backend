class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show, :update, :destroy]

  # GET /profiles
  def index
    @profiles = Profile.all

    render json: @profiles
  end

  # GET /profiles/1
  def show
    puts @profile.properties.inspect
    render json: @profile
  end

  # POST /profiles
    def create
      user = Profile.create(profile_params)
      
      puts"Hellllooooooo"
      puts
      puts profile_params
      puts
      puts user.inspect
      puts user.valid?
      
      if user.valid?
          user = user
          token = JWT.encode({user_id: user.id}, "mysecretcode", 'HS256')
          render json: {user: user, token: token}
      else
          render json: {errors: user.errors.full_messages}
      end
    end
    
  # PATCH/PUT /profiles/1
  def update
    register_params2 = {first_name: params[:first_name], last_name: params[:last_name],
        contact_no: params[:contact_no], company_name: params[:company_name], company_address: params[:company_address]}
    
    if @profile.update(register_params2)
      render json: @profile
    else
      render json: @profile.errors, status: :unprocessable_entity
    end
  end

  # DELETE /profiles/1
  def destroy
    @profile.destroy
  end
  
  # GET /profiles/getProperties/1
  def getProperties
    params.permit!
    puts params.inspect
    puts params[:id]
    @profile = Profile.find(params[:id])
    puts @profile.properties
    render json: @profile.properties
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_profile
      @profile = Profile.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def profile_params
      #params.fetch(:profile, {:first_name, :last_name, :contact_no, :designation, })
      params.permit!
      register_params = {first_name: params[:first_name], last_name: params[:last_name], designation: params[:designation],
        email: params[:email], contact_no: params[:contact_no], password: params[:password]}
      return register_params
    end
end
