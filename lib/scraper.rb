# Object for scraping information off of websites
class Scraper
  attr_reader :urls, :items

  def initialize(urls:)
    @urls = urls
    @items = []
  end

  # Provides a generic method for scraping data off of websites.
  #  Must pass a block that dictates how to interact with the webpage.
  # @return [Array] - Collection of scraped data
  def scrape
    browser = Watir::Browser.new

    urls.each do |url|
      browser.goto(url)
      @items.concat(yield(browser))
    end

    browser.close

    items
  end

  # Write scraped data to CSV.
  #
  # @param filepath [String] default: nil - path to write CSV to
  # @param include_headers [Boolean] default: false - whether or not to include headers in CSV
  # @param headers [Array[String]] default: [] - headers to include CSV
  def output_to_csv(filepath:, include_headers: false, headers: [])
    CSV.open(filepath, 'wb', write_headers: include_headers, headers: headers) do |csv|
      items.each do |items|
        csv << items
      end
    end
  end
end
