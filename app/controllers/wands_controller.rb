class WandsController < ApplicationController
  def home
    @wands = Wand.all
  end

  def index
    @wands = Wand.all
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
