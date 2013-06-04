class PlacesController < ApplicationController
  load_and_authorize_resource

  before_filter :find_place, only: [:show, :edit, :update]

  def index
    conditions = []
    unless params[:all]
      conditions << "disabled IS NULL OR disabled = 0"
    end

    @places = Place.paginate(page: params[:page], per_page: 50, conditions: conditions, order: :name)
  end

  def show
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(params[:place])
    @place.added_by = current_user.id
    if @place.save
      flash[:success] = "Place added."
      redirect_to places_path
    else
      flash[:error] = "Unable to add place."
      render :new
    end
  end

  def edit
  end

  def update
    if @place.update_attributes params[:place]
      flash[:success] = "Place saved."
      redirect_to places_path
    else
      flash[:error] = "Unable to save place."
      render :edit
    end
  end

  def destroy
    @place = Place.find(params[:id])
    @place.destroy
    flash[:success] = "Place deleted."
    redirect_to places_path
  end

  private

  def find_place
    @place = Place.find(params[:id])
  rescue
    flash[:error] = "Unable to find place."
    redirect_to places_path
  end
end
