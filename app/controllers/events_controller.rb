class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper
  # GET /events
  # GET /events.json
  def index

    #events_scope = Event.event_curator_users_filter(params[:curator_filter])
    #events_scope = events_scope.event_curator_users_filter(params[:event_curator_users_filter])
    #events_scope = events_scope.event_curator_users_filter if params[:event_curator_users_filter] == "1"
    events_scope = Event.title_search(params[:filter])

    if (params[:curator_filter] != nil) && (params[:curator_filter] != "")
      events_scope = events_scope.event_curator_users_filter(params[:curator_filter])
    end

    if (params[:state_filter] != nil) && (params[:state_filter] != "")
      events_scope = events_scope.state_filter(params[:state_filter])
    end

    if (params[:date_filter] != nil) && (params[:date_filter] != "")
      events_scope = events_scope.date_search(params[:date_filter])
    end
    smart_listing_create :events,events_scope, partial: "events/list",
                         default_sort: {date_start: "desc"}
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:name, :place, :place_type, :event_type, :date_load, :client, :greeter, :description, :condition)
    end
end
