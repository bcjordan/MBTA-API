class Station < ActiveRecord::Base

  acts_as_mappable :default_units => :miles,
                           :default_formula => :sphere,
                           :distance_field_name => :distance,
                           :lat_column_name => :stop_lat,
                           :lng_column_name => :stop_lon

end
