# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'csv'
require 'location'

work_order_file = File.expand_path(File.join(__dir__, '/work_orders.csv'))
technician_file = File.expand_path(File.join(__dir__, '/technicians.csv'))
location_file = File.expand_path(File.join(__dir__, '/locations.csv'))

# Add Locations
CSV.read(location_file, headers: true).map do |row| 
  Location.find_or_create_by(name: row['name'], city: row['city'])
end

# Add Techicians
CSV.read(technician_file, headers: true).map do |row| 
  Technician.find_or_create_by(name: row['name'])
end

# Add Work Orders
CSV.read(work_order_file, headers: true).map do |row| 
  WorkOrder.find_or_create_by(technician: Technician.find(row['technician_id']), location: Location.find(row['location_id']), time: row['time'],duration: row['duration'], price: row['price'])
end