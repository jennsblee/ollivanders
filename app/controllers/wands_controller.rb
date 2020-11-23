class WandsController < ApplicationController
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

  def show; end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def wand_params
    params.require(:wand).permit(:name, :description, :wood, :core, :price, :size)
  end
end
