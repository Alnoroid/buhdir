class EventPricesController < ApplicationController
  before_action :set_event_price, only: [:show, :edit, :update, :destroy]

  # GET /event_prices
  # GET /event_prices.json
  def index
    @event_prices = EventPrice.all
  end

  # GET /event_prices/1
  # GET /event_prices/1.json
  def show
  end

  # GET /event_prices/new
  def new
    @event_price = EventPrice.new
  end

  # GET /event_prices/1/edit
  def edit
  end

  # POST /event_prices
  # POST /event_prices.json
  def create
    @event_price = EventPrice.new(event_price_params)

    respond_to do |format|
      if @event_price.save
        format.html { redirect_to @event_price, notice: 'Event price was successfully created.' }
        format.json { render :show, status: :created, location: @event_price }
      else
        format.html { render :new }
        format.json { render json: @event_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /event_prices/1
  # PATCH/PUT /event_prices/1.json
  def update
    respond_to do |format|
      if @event_price.update(event_price_params)
        format.html { redirect_to @event_price, notice: 'Event price was successfully updated.' }
        format.json { render :show, status: :ok, location: @event_price }
      else
        format.html { render :edit }
        format.json { render json: @event_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /event_prices/1
  # DELETE /event_prices/1.json
  def destroy
    @event_price.destroy
    respond_to do |format|
      format.html { redirect_to event_prices_url, notice: 'Event price was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event_price
      @event_price = EventPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_price_params
      params.require(:event_price).permit(:event_id, :artist_id, :place_id, :price_id, :custom_name, :custom_description, :cost, :price_from)
    end
end
