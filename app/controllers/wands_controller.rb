class WandsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_wand, only: [:show, :edit, :update, :destroy]
  after_action :authorize_wand, except: :index

  def index
    # params[:query].present? ? @wands = Wand.search(params[:query]) : @wands = policy_scope(Wand).order(created_at: :desc)
    @wands = policy_scope(Wand).order(created_at: :desc)
    @wands = Wand.search(params[:query]) if params[:query].present?

    @markers = @wands.geocoded.map do |wand|
      {
        lat: wand.latitude,
        lng: wand.longitude,
        infoWindow: render_to_string(partial: "shared/info_window", locals: { wand: wand }),
        image_url: helpers.asset_url('wand2.png')
      }
    end
  end

  def new
    @wand = Wand.new
    # authorize @wand
  end

  def create
    @wand = Wand.new(wand_params)
    @wand.user = current_user
    # authorize @wand

    if @wand.save
      redirect_to wand_path(@wand), notice: 'Wand was successfully created.'
    else
      render :new
    end
  end

  def show
    @booking = Booking.new
  end

  def edit; end

  def update
    @wand = Wand.new(wand_params)
    @wand.user = current_user

    if @wand.save
      redirect_to wand_path(@wand), notice: 'Wand was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @wand.destroy

    redirect_to dashboard_path(current_user), notice: 'Wand was successfully deleted.'
  end

  private

  def set_wand
    @wand = Wand.find(params[:id])
    # authorize @wand
  end

  def wand_params
    params.require(:wand).permit(:name, :wood, :core, :price, :size, :description, :address, photos: [] )
  end

  def authorize_wand
    authorize @wand
  end
end
