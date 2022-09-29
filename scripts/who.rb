require 'open-uri'

count = URI.open("https://nazgum.com/mume/player-count.txt").read.to_i
puts "#var {players} {#{count}}"
