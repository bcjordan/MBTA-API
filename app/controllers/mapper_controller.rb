require 'open-uri'

class MapperController < ApplicationController
  respond_to :json, :html

  def station
    render :json => Station.find_all_by_stop_id(params[:id])
  end

  def find_closest_stations
    render :json => Station.find_within(10, :origin => [params[:lat], params[:lon]])
  end

  def station_schedule
    stations = Station.find_all_by_stop_id(params[:id])

    stations.map!{ |s| s.platform_key }

    trains = []
    stations.each{ |s| trains.concat(find_trains(s)) }

    render :json => trains
  end

  def index
  end

  private

  def update_trains
    [].tap do |trains|
      ["red", "blue", "orange"].each do |line|
        json_hash = JSON.parse(open(
          "http://developer.mbta.com/Data/#{line}.json").read)

        json_hash.each { |t|
          attrs = { :line => t["Line"], :trip => t["Trip"],
            :platform_key => t["PlatformKey"],
            :information_type => t["InformationType"],
            :arrived => t["Arrived"],
            :time => t["Time"],
            :time_remaining => t["TimeRemaining"],
            :revenue => t["Revenue"]
            :route => t["Route"] }

          trains << Train.new attrs
        }
      end
    end

  def get_json_for platform_key
    line =  case platform_key[0..0]
            when "R"
              "red"
            when "B"
              "blue"
            when "O"
              "orange"
            end
   
    "http://developer.mbta.com/Data/#{line}.json"
  end

  def find_trains platform_key
    logger.debug platform_key
    result = JSON.parse(open(get_json_for platform_key).read)
    logger.debug result
    [].tap do |a|
      result.each { |train|
        a << train if train["PlatformKey"] == platform_key
      }
    end
  end
end
