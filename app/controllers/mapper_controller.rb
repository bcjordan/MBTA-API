class MapperController < ApplicationController
  respond_to :json

  def station
    respond_with Station.find_all_by_stop_id(params[:id])
  end

  def find_closest_stations
  end

  def station_schedule
  end

  def index
  end

end
