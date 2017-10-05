class AddLatLongToStations < ActiveRecord::Migration[5.1]
  def change
    add_column :stations, :lat, :integer
    add_column :stations, :lng, :integer
  end
end