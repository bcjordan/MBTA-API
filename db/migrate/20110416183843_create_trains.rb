class CreateTrains < ActiveRecord::Migration
  def self.up
    create_table :trains do |t|
      t.string :line
      t.string :trip
      t.string :platform_key
      t.string :information_type
      t.string :arrived
      t.string :time
      t.string :time_remaining
      t.string :revenue
      t.string :route

      t.timestamps
    end
  end

  def self.down
    drop_table :trains
  end
end
