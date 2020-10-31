# Object for retrieving glaze information from Amaco website
class AmacoScraper
  attr_reader :urls, :glazes, :headers

  def initialize(urls:)
    @urls = urls
    @glazes = []
    @headers = %w[brand_name glaze_name]
  end

  def scrape
    browser = Watir::Browser.new

    urls.each do |url|
      browser.goto(url)

      list_items = browser.ul(class: 'product-listing').lis
      list_items.each do |list_item|
        @glazes << [
          'amaco',
          list_item.span(class: 'product-title').text
        ]
      end
    end

    browser.close

    glazes
  end

  def output_to_csv(filepath:, include_headers: true)
    CSV.open(filepath, 'wb', write_headers: include_headers, headers: headers) do |csv|
      glazes.each do |glaze|
        csv << glaze
      end
    end
  end
end
