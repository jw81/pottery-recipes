# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Storing Amaco Glazes in database...'
GlazeStructure = Struct.new(:brand_name, :product_number, :name)
entries = CSV.read(File.join(Rails.root, 'tmp/scrapes/output/amaco.csv'))
entries = entries.map { |entry| GlazeStructure.new(entry[0], entry[1], entry[2]) }
entries.each do |entry|
  Glaze.create!(brand_name: entry.brand_name, product_number: entry.product_number, name: entry.name)
end
puts 'Storing Amaco Glazes in database...DONE'
