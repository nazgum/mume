class Screen
   attr_accessor :prompt, :pastel, :app, :char

   def initialize
      @prompt = TTY::Prompt.new
      @pastel = Pastel.new
   end

   def blank
      for num in 0 .. TTY::Screen.height
         puts ""
      end
   end

   def mume
      blank()

      max_w = TTY::Screen.width
      max_w = 80 if max_w > 80

      for str in [
         ' ***  MUME VIII  ***',
         'In progress at FIRE',
         '(Free Internet Roleplay Experiences)',
         'Hosted at HEIG-VD (www.heig-vd.ch)',
         'Adapted from J.R.R. Tolkien\'s Middle-earth world and',
         'maintained by CryHavoc, Manwe, and Nada.',
         'Original code DikuMUD I (help credits), created by:',
         'S. Hammer, T. Madsen, K. Nyboe, M. Seifert, and H.H. Staerfeldt.'
      ]
         puts str.center(max_w, ' ')
      end

      puts 'If you have never played MUME before, type NEW to create a new character,'
      puts 'or ? for help. Otherwise, type your account or character name.'
      puts ''

      @prompt.ask("By what name do you wish to be known?")
      choose_army()
   end

   def choose_army
      blank()

      puts @pastel.bold 'Choose Your Allegiance'
      puts Util.wrap 'MUME takes place in the late Third Age, before the events described in The Hobbit and after the loss of the One Ring by Sauron. A three way war is escalating throughout the lands between three powerful forces.'
      puts ''

      for army in Data.armies
         puts "(#{army[:key]}) " + @pastel.bold.cyan(army[:name])
      end
      puts ''

      resp = @prompt.ask("Which side will you fight for?")

      char.reset()
      char.army = Data.armies.find {|a| a[:key] == resp}[:id]
      choose_race()
   end

   def choose_race
      army = Data.armies.find {|a| a[:id] == char.army}

      puts ''
      puts @pastel.bold army[:name]
      puts Util.wrap army[:desc]
      puts ''

      puts @pastel.bold "Choose Your Race"

      for race in Data.races
         next unless race[:army] == army[:id] 

         puts "(#{race[:key]}) " + @pastel.bold.cyan(race[:name])
      end
      puts ''

      resp = @prompt.ask("Which race will you be?")
      
      race = Data.races.find {|r| r[:key] == resp and r[:army] == char.army}
      char.race = race[:id]

      if race[:subraces]
         choose_subrace()
      else
         confirm_race()
      end
   end

   def choose_subrace
      race = Data.races.find {|r| r[:id] == char.race and r[:army] == char.army}

      puts ''
      puts @pastel.bold "Choose Your Subrace"

      for subrace in race[:subraces]
         next unless subrace[:race] == race[:id] 

         puts "(#{subrace[:key]}) " + @pastel.bold.cyan(subrace[:name])
      end
      puts ''

      resp = @prompt.ask("Which subrace will you be?")

      char.subrace = race[:subraces].find {|r| r[:key] == resp}[:id]
      confirm_subrace()
   end

   def confirm_race
      race = Data.races.find {|r| r[:id] == char.race and r[:army] == char.army}

      puts ''
      puts @pastel.bold race[:name]
      puts Util.wrap race[:desc]
      puts ''

      for feature in race[:features]
         puts Util.wrap feature
      end if race[:features]

      puts @pastel.black.italic race[:restricted] if race[:restricted]
      puts ''

      resp = @prompt.yes?("You will be a #{race[:name]}?")

      case resp
      when true
         choose_hometown()
      when false
         choose_army()
      end
   end

   def confirm_subrace
      race    = Data.races.find {|r| r[:id] == char.race and r[:army] == char.army}
      subrace = race[:subraces].find {|r| r[:id] == char.subrace}

      puts ''
      puts @pastel.bold "#{subrace[:name]} #{race[:name]}"

      if subrace[:desc]
         puts Util.wrap subrace[:desc]
      else
         puts Util.wrap race[:desc]
      end
      puts ''

      for feature in race[:features]
         puts Util.wrap feature
      end if race[:features]

      for feature in subrace[:features]
         puts Util.wrap feature
      end if subrace[:features]

      puts @pastel.black.italic subrace[:restricted] if subrace[:restricted]
      puts ''

      resp = @prompt.yes?("You will be a #{subrace[:name]} #{race[:name]}?")

      case resp
      when true
         choose_hometown()
      when false
         choose_army()
      end
   end

   def choose_hometown
      race = char.race_data

      puts ''
      puts @pastel.bold "Your Hometown"
      puts Util.wrap "Choose where your character lives in Middle Earth.  This will be the location you begin your journey from, and you will have citizenship in this town."
      puts ''

      race[:hometowns].each_with_index do |town, index|
         puts "(#{index+1}) " + @pastel.bold.cyan(town)
      end
      puts ''

      resp = @prompt.ask("What is your hometown?")
      
      char.hometown = race[:hometowns][resp.to_i - 1]

      choose_sex()
   end

   def choose_sex
      puts ''
      puts @pastel.bold "Choose your Sex"
      puts Util.wrap "You can choose for your character to be a male or female.  Your choice will have no impact on gameplay."
      puts ''
      puts "(1) " + @pastel.bold.cyan("Male")
      puts "(2) " + @pastel.bold.cyan("Female")
      puts ''

      resp = @prompt.ask("What is your sex?")
      
      case resp
      when '1'  then char.sex = "Male"
      when '2'  then char.sex = "Female"
      end

      choose_alignment()
   end

   def choose_alignment
      puts ''
      puts @pastel.bold "Choose your Alignment"
      puts Util.wrap "The basic attitude of your character. It can slowly change during the game, but it will tend to return to its initial value."
      puts ''
      puts "(1) " + @pastel.bold.cyan("Well-disposed")
      puts "(2) " + @pastel.bold.cyan("Thoughtful")
      puts "(3) " + @pastel.bold.cyan("Undecided")
      puts "(4) " + @pastel.bold.cyan("Decadent")
      puts "(5) " + @pastel.bold.cyan("Corrupt")
      puts ''

      resp = @prompt.ask("What is your alignment?")
      
      case resp
      when '1'  then char.alignment = "Well-disposed"
      when '2'  then char.alignment = "Thoughtful"
      when '3'  then char.alignment = "Undecided"
      when '4'  then char.alignment = "Decadent"
      when '5'  then char.alignment = "Corrupt"
      end

      choose_stats()
   end

   def choose_stats
      puts ''
      puts @pastel.bold "Character Stats"
      puts Util.wrap 'If you are an experienced player in MUME you likely prefer to choose your own stats.  If you are a new player, you can instead choose to Use an Archtype that closely resembles how you intend to play your character.'
      puts ''
      puts "(1) " + @pastel.bold.cyan("Choose Stats")
      puts "(2) " + @pastel.bold.cyan("Use an Archtype")
      puts ''

      resp = @prompt.ask("How will you select your stats?")
      
      #case resp
      #when '1' then custom_stats()
      #when '2' then choose_archtype()
      #end
      choose_name()
   end

   def choose_name
      puts ''
      puts @pastel.bold "Character Name"
      puts Util.wrap "MUME encourages a role-play environment so we ask that players choose names for their characters which fit reasonably with the race and subrace of the character they are playing, as well as with the environment of J.R.R. Tolkien's Middle-earth."
      puts ''

      char.name = @prompt.ask("What is your characters name?")

      overview()
   end

   def overview
      blank()
      puts @pastel.bold "Your Character"
      puts ''.ljust(50, '-')

      puts @pastel.bold.cyan("Name:".ljust(20))       + char.name
      puts @pastel.bold.cyan("Alignment:".ljust(20))  + char.alignment
      puts @pastel.bold.cyan("Sex:".ljust(20))        + char.sex
      puts @pastel.bold.cyan("Allegiance:".ljust(20)) + char.army_data[:name]
      puts @pastel.bold.cyan("Home Town:".ljust(20))  + char.hometown
      puts @pastel.bold.cyan("Race:".ljust(20))       + char.full_race
      puts ''
      puts @pastel.bold.cyan('Racial Features:')

      for feature in char.race_data[:features]
         puts Util.wrap feature
      end if char.race and char.race_data.has_key?(:features)

      for feature in char.subrace_data[:features]
         puts Util.wrap feature
      end if char.subrace and char.subrace_data.has_key?(:features)

      puts ''.ljust(50, '-')
      puts ''

      resp = @prompt.yes?("Are you happy with your character?")

      case resp
      when true  then app.screen.mume()  # all done, restart
      when false then choose_army()
      end
   end
end