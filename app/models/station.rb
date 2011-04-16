class Station < ActiveRecord::Base

  acts_as_mappable :default_units => :miles,
                           :default_formula => :sphere,
                           :distance_field_name => :distance,
                           :lat_column_name => :stop_lat,
                           :lng_column_name => :stop_lon


  def html
    '<iframe title="Station Schedule" class="testing" type="text/html" width="480" src="' + "mapper/station_schedule/#{self.stop_id}.html" + '" frameborder="0"></iframe>'
  end

  def color_link
    color = case self.platform_key[0..0]
              when "R"
                "FF0000"
              when "B"
                "0000FF"
              when "O"
                "FF7300"
              end

    "http://chart.googleapis.com/chart?chst=d_map_xpin_letter&chld=pin|+|#{color}|000000|FF0000"
  end

end
