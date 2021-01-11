require 'open-uri'
require 'nokogiri'
require 'json'
require 'pry'

class LibraryScraper

    @@composer_ids = []

    def scrape_composers
        url = 'https://api.openopus.org/composer/list/pop.json'
        response = Nokogiri::HTML(URI.open(url))
        composers_hash = JSON.parse(response)["composers"]
        composer_id = []
        composers_hash.each do |composer|
            @@composer_ids << composer["id"].to_i
        end
        File.write('composers.json', composers_hash.to_json)
    end

    def scrape_library
        scrape_composers
        works = []
        @@composer_ids.each do |id|
            works_attr = {}
            url = "https://api.openopus.org/work/list/composer/#{id}/Orchestral.json"
            response = Nokogiri::HTML(URI.open(url))
            composer = JSON.parse(response)["composer"]["name"]
            compositions = JSON.parse(response)["works"]
            works_attr[:composer] = composer
           works_attr[:title] = compositions
            works << works_attr
        end
        File.write('works.json', works.to_json)
    end

end