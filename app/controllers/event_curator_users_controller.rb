class EventCuratorUsersController < ApplicationController
  before_action :set_event_curator_user, only: [:show, :edit, :update, :destroy]

  # GET /event_curator_users
  # GET /event_curator_users.json
  def index
    @event_curator_users = EventCuratorUser.all
  end

  # GET /event_curator_users/1
  # GET /event_curator_users/1.json
  def show
  end

  # GET /event_curator_users/new
  def new
    @event_curator_user = EventCuratorUser.new
  end

  # GET /event_curator_users/1/edit
  def edit
  end

  # POST /event_curator_users
  # POST /event_curator_users.json
  def create
    @event_curator_user = EventCuratorUser.new(event_curator_user_params)

    respond_to do |format|
      if @event_curator_user.save
        format.html { redirect_to @event_curator_user, notice: 'Event curator user was successfully created.' }
        format.json { render :show, status: :created, location: @event_curator_user }
      else
        format.html { render :new }
        format.json { render json: @event_curator_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_curator_users/1
  # PATCH/PUT /event_curator_users/1.json
  def update
    respond_to do |format|
      if @event_curator_user.update(event_curator_user_params)
        format.html { redirect_to @event_curator_user, notice: 'Event curator user was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_curator_user }
      else
        format.html { render :edit }
        format.json { render json: @event_curator_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_curator_users/1
  # DELETE /event_curator_users/1.json
  def destroy
    @event_curator_user.destroy
    respond_to do |format|
      format.html { redirect_to event_curator_users_url, notice: 'Event curator user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_curator_user
      @event_curator_user = EventCuratorUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_curator_user_params
      params.require(:event_curator_user).permit(:event_id, :user_id)
    end
end
