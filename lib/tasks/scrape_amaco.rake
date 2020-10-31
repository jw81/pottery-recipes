require 'csv'
require 'watir'
require 'amaco_scraper'

urls = [
  'https://www.amaco.com/t/glazes-and-underglazes/underglaze/velvet-underglaze/velvet-underglazes#more',
  'https://www.amaco.com/t/glazes-and-underglazes/underglaze/low-fire-underglazes#more',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/artists-choice',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/crystaltex#more',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/f-series#more',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/low-fire-gloss#more',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/low-fire-matt#more',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/opalescent',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/textured-alligator',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/teachers-choice-and-palette#more',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/teachers-palette-light',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/teachers-choice',
  'https://www.amaco.com/t/glazes-and-underglazes/low-fire/dipping-glazes',
  'https://www.amaco.com/t/glazes-and-underglazes/high-fire/potters-choice#more',
  'https://www.amaco.com/t/glazes-and-underglazes/high-fire/celadons#more',
  'https://www.amaco.com/t/glazes-and-underglazes/high-fire/high-fire',
  'https://www.amaco.com/t/glazes-and-underglazes/high-fire/satin-matt',
  'https://www.amaco.com/t/glazes-and-underglazes/high-fire/sh-shino',
  'https://www.amaco.com/t/glazes-and-underglazes/specialty/raku',
  'https://www.amaco.com/t/glazes-and-underglazes/specialty/texturizer'
]

# Scrapes glaze information from the Amaco website and outputs to a CSV file.
namespace :scrape do
  desc 'Gather glaze information from Amaco website.'

  task :amaco do
    scraper = AmacoScraper.new(urls: urls)
    puts 'Gathering Amaco glaze information...'
    scraper.scrape
    scraper.output_to_csv(filepath: 'tmp/scrapes/output/amaco.csv')
    puts 'Done!'
  end
end
