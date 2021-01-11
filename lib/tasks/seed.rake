require_relative '../../config/environment'

namespace :db do

    desc 'scrape composer data from web and save to local json file'
    task :composer_scrape do
        LibraryScraper.new.scrape_composers
        puts 'Scraping done, local json file rewritten.'
    end

    desc 'scrape works data from web and save to local json file'
    task :library_scrape do
        LibraryScraper.new.scrape_library
        puts 'Scraping done, local json file rewritten.'
    end

    namespace :seed do

        desc 'seed db from local json file'
        task :local do
            require_relative '../../db/local_seed'
            puts 'Seeding done.'
        end

    end
end
