require 'csv'
require 'watir'

# Scrapes glaze information from the Amaco website and outputs to a CSV file.
namespace :scrape do
  desc 'Gather glaze information from Amaco website.'

  task :amaco do
    puts 'Gathering Amaco glaze information...'

    glaze_pages = [
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

    browser = Watir::Browser.new
    glazes  = []

    glaze_pages.each do |glaze_page|
      browser.goto(glaze_page)

      list_items = browser.ul(class: 'product-listing').lis
      list_items.each do |list_item|
        glazes << [
                    'amaco',
                    list_item.span(class: 'product-title').text
                  ]
      end
    end

    filepath = 'tmp/scrapes/output/amaco.csv'
    headers  = %w[brand_name glaze_name]
    CSV.open(filepath, 'wb', write_headers: true, headers: headers) do |csv|
      glazes.each do |glaze|
        csv << glaze
      end
    end

    browser.close
    puts 'Done!'
  end
end
