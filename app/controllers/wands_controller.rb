class WandsController < ApplicationController
  before_action :set_wand, only: [:show, :edit, :update, :destroy]

  def home
  end

  def index
  end

  def new
    @wand = Wand.new
  end

  def create
    @wand = Wand.new(wand_params)

    if @wand.save
      redirect_to wand_path(@wand)
    else
      render :new
    end
  end

  def show
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

    #eventually we would want to redirect to the users(wands page) where they can see all their wands,
    #since they are the one seeing this
    redirect_to wands_path
  end

  private

  def set_wand
    @wand = Wand.find(params[:id])
  end

  def wand_params
    params.require(:wand).permit(:name, :wood, :core, :price, :size, :description)
  end

  private

  def wand_params
    params.require(:wand).permit(:name, :description, :wood, :core, :price, :size)
  end
end
