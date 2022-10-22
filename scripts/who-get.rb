require 'open-uri'

count = URI.open("https://nazgum.com/mume/player-count.txt").read.to_i
File.open("/home/nazgum/mume/scripts/player-count.txt", "w") {|f| f.write(count) }
