class FurnishingsController < ApplicationController
  before_action :set_furnishing, only: [:show, :update, :destroy]

  # GET /furnishings
  def index
    @furnishings = Furnishing.all

    render json: @furnishings
  end

  # GET /furnishings/1
  def show
    render json: @furnishing
  end

  # POST /furnishings
  def create
    @furnishing = Furnishing.new(furnishing_params)

    if @furnishing.save
      render json: @furnishing, status: :created, location: @furnishing
    else
      render json: @furnishing.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /furnishings/1
  def update
    if @furnishing.update(furnishing_params)
      render json: @furnishing
    else
      render json: @furnishing.errors, status: :unprocessable_entity
    end
  end

  # DELETE /furnishings/1
  def destroy
    @furnishing.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_furnishing
      @furnishing = Furnishing.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def furnishing_params
      params.fetch(:furnishing, {})
    end
end
