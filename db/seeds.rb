# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts 'Storing Amaco Glazes in database...'
GlazeStructure = Struct.new(:brand_name, :name)
entries = CSV.read(File.join(Rails.root, 'tmp/scrapes/output/amaco.csv'))
entries = entries.map { |entry| GlazeStructure.new(entry[0], entry[1]) }
entries.each { |entry| Glaze.create!(brand_name: entry.brand_name, name: entry.name) }
puts 'Storing Amaco Glazes in database...DONE'
