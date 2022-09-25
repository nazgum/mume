require 'open-uri'

URI.open "http://nazgum.com/mume/player-count.txt" do |uri|
  puts uri.read
end

