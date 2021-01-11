require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'

class Scraper
    @@composers = []
    

    def self.scrape_composers
            url = "https://api.openopus.org/composer/list/pop.json"
            response = Nokogiri::HTML(open(url))
            doc = JSON.parse(response)
            binding.pry
    end
    self.scrape_composers

end

