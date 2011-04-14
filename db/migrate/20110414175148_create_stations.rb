class CreateStations < ActiveRecord::Migration
  def self.up
    create_table :stations do |t|
      t.string :line
      t.string :platform_key
      t.string :platform_name
      t.string :station_name
      t.integer :platform_order
      t.string :start_of_line
      t.string :end_of_line
      t.string :branch
      t.string :direction
      t.string :stop_id
      t.string :stop_code
      t.string :stop_name
      t.string :stop_desc
      t.float :stop_lat
      t.float :stop_lon

      t.timestamps
    end
  end

  def self.down
    drop_table :stations
  end
end
