class EventsController < ApplicationController
  before_action :role_required
  before_action :set_event, only: [:show, :edit, :update, :destroy]
  include SmartListing::Helper::ControllerExtensions
  helper SmartListing::Helper

  def smart_list
    if (params[:price_category_filter] != nil) && (params[:price_category_filter] != "")
      events_new_scope = Price.catsearch(params[:price_category_filter])
    else
      events_new_scope = Price.where("price_category_id < '11'")
    end

    @prices = smart_listing_create :prices,events_new_scope, partial: "events/select_list",unlimited_per_page: true,page_sizes: [1000],default_sort: {id: "asc"}

  end
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
      events_scope = events_scope.date_search(Date.parse("01." + params[:date_filter]))
    end
    smart_listing_create :events,events_scope, partial: "events/list",page_sizes: [20,50,100],
                         default_sort: {date_start: "desc"}
  end

  # GET /events/1
  # GET /events/1.json

  def create_docx
    params[:event][:event_curator_users_attributes].values.each do |curator|
      @usernameid = curator[:user_id]
    end
    @user = User.find(@usernameid)

      respond_to do |format|
        format.docx { headers["Content-Disposition"] = "attachment; filename=\"КП " + params[:event][:name] + ".docx\"" }
    end
  end

  def show
    #@prices = Price.find_by("id = ?", params[:])
  end

  # GET /events/new
  def new
    @event = Event.new
    @event.event_curator_users.build
    @event.build_client
    @event.event_prices.build(:image_name => 'price/logo1.png', :price_category_id => '8', :custom_name => 'Транспортные расходы',:custom_description => 'Расходы, связанные с перевозкой вышеперечисленного оборудования при монтаже и демонтаже оборудования, а также, расходы по доставке обслуживающего персонала к месту проведения мероприятия.',:cost => '3000',:count=>'1')
    @event.event_prices.build(:image_name => 'price/logo1.png', :price_category_id => '8', :custom_name => 'Работа офиса по подготовке мероприятия',:custom_description => 'Вознаграждение исполнителя, а также налоги и сборы, уплачиваемые на территории РФ.',:cost => '5000',:count=>'1')
    smart_list
  end


  # GET /events/1/edit
  def edit
    smart_list
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    smart_list

    respond_to do |format|
      if @event.save
        format.html { redirect_to events_url, notice: 'Мероприятие успешно создано.' }
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
        format.html { redirect_to action: "index", notice: 'Мероприятие успешно обновлено.' }
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
      format.html { redirect_to events_url, notice: 'Мероприятие успешно удалено.' }
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
      params.require(:event).permit(:price_category,:price_category_id, :name, :place, :place_type, :date_start, :date_finish, :date_load, :greeter, :greeter_phone, :description, :client_id, :condition,:guests, event_curator_users_attributes: [:id,:user_id,:event_id,:custom], client_attributes: [:name, :phone, :email, :notes, :company], event_prices_attributes: [:id, :price_id, :custom_name, :custom_description, :cost, :count,:image_name, :price_category_id,  :_destroy,prices_attributes:[:image_file_name]])
      #params.require(:event).permit(client_attributes: [:id, :name, :phone, :email, :notes])
      #params.require(:event).permit!
    end
end
