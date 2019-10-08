require 'open-uri'
require 'nokogiri'
require 'pry'

class Scraper
end

  require 'nokogiri'
 require 'open-uri'

 site = "http://gcplsoccer.bonzidev.com/sam/standings/ss/schedule.php?v=3&divisionID=NDE4MjM5/*"

 doc = Nokogiri::HTML(open(site))

 # code to select [nth]team in table position

 # outputs a huge table I only needs the first 18 or 19 rows
 table = doc.css("//tr")[5]



 # code to get team stats and strip whitespace returns as string
 team_stats = table.css("td").text.gsub(/(\n|\t|\r)/, ' ').gsub(/>\s*</, '><').squeeze(' ').strip

 # code to create array from Team_stats string
 text_preped_for_array = team_stats.scan(/[a-zA-Z\s][^\d]+|\d+/)
 table_array = text_preped_for_array.join(", ")

 # Builds a hash with
 def hash_build(text)
   @stats = {}
   text.collect |stat|
     stat[0] = team_name
     stat[1] = wins
     stat[2] = losses
     stat[3] = draws
     stat[4] = points
     stat[5] = goals_for
     stat[6] = goals_against
     @stats << {:team => team_name, :wins => wins, :losses => losses, :draws => draws, :points => points, :goals_for => goals_for, :goals_against => goals_against}
   end
   puts @stats
 end
binding.pry
hash_build(table_array)
#binding.pry


#puts Scraper.new.scrape_index_page(https://learn-co-curriculum.github.io/student-scraper-test-page/index.html)
