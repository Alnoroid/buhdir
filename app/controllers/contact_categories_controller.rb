class ContactCategoriesController < ApplicationController
  before_action :set_contact_category, only: [:show, :edit, :update, :destroy]

  # GET /contact_categories
  # GET /contact_categories.json
  def index
    @contact_categories = ContactCategory.all
  end

  # GET /contact_categories/1
  # GET /contact_categories/1.json
  def show
  end

  # GET /contact_categories/new
  def new
    @contact_category = ContactCategory.new
  end

  # GET /contact_categories/1/edit
  def edit
  end

  # POST /contact_categories
  # POST /contact_categories.json
  def create
    @contact_category = ContactCategory.new(contact_category_params)

    respond_to do |format|
      if @contact_category.save
        format.html { redirect_to @contact_category, notice: 'Contact category was successfully created.' }
        format.json { render :show, status: :created, location: @contact_category }
      else
        format.html { render :new }
        format.json { render json: @contact_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contact_categories/1
  # PATCH/PUT /contact_categories/1.json
  def update
    respond_to do |format|
      if @contact_category.update(contact_category_params)
        format.html { redirect_to @contact_category, notice: 'Contact category was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact_category }
      else
        format.html { render :edit }
        format.json { render json: @contact_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_categories/1
  # DELETE /contact_categories/1.json
  def destroy
    @contact_category.destroy
    respond_to do |format|
      format.html { redirect_to contact_categories_url, notice: 'Contact category was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact_category
      @contact_category = ContactCategory.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_category_params
      params.require(:contact_category).permit(:name)
    end
end
