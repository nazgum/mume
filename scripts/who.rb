count = File.open("/home/nazgum/mume/scripts/player-count.txt") {|f| f.read }
puts "#var {players} {#{count}}"
