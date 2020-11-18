class OtherRoomsController < ApplicationController
  before_action :set_other_room, only: [:show, :update, :destroy]

  # GET /other_rooms
  def index
    @other_rooms = OtherRoom.all

    render json: @other_rooms
  end

  # GET /other_rooms/1
  def show
    render json: @other_room
  end

  # POST /other_rooms
  def create
    @other_room = OtherRoom.new(other_room_params)

    if @other_room.save
      render json: @other_room, status: :created, location: @other_room
    else
      render json: @other_room.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /other_rooms/1
  def update
    if @other_room.update(other_room_params)
      render json: @other_room
    else
      render json: @other_room.errors, status: :unprocessable_entity
    end
  end

  # DELETE /other_rooms/1
  def destroy
    @other_room.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_other_room
      @other_room = OtherRoom.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def other_room_params
      params.fetch(:other_room, {})
    end
end
