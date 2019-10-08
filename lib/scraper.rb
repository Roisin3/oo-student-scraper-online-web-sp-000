require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
end
require 'nokogiri'
require 'open-uri'

 site = "https://learn-co-curriculum.github.io/student-scraper-test-page/"
 doc = Nokogiri::HTML(open(site))

