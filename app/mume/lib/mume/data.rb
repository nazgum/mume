module Data

   def self.armies
      [
         {
            id: "free", key: "1", name: "Free People",
            desc: "The races of men, elves, dwarves and hobbits unite to battle the evil growing within the shadows of Mordor."
         },
         {
            id: "sauron", key: "2", name: "Forces of Sauron",
            desc: "The mighty Tarkhnarb orcs, trolls and black numenoreans of the armies of the east demand your servitude."
         },
         { 
            id: "renegade", key: "3", name: "Renegade Zaugurz",
            desc: "This tribe of Zaugurz orcs are sworn enemies of the Tarkhnarb orcs and their allies, as well as the free peoples."
         }
      ]
   end
   
   def self.races
      [
         # free people
         {
            id: "man", key: "1", name: "Man", plural: "Men", army: "free",
            desc: "One of the youngest races to have awakened on Arda.",
            hometowns: ["Tower Hills", "Fornost", "Bree"],
            subraces: [
               {
                  id: "eriadorian", key: "1", name: "Eriadorian", race: "man",
                  desc: "The Eriadorian people are the common people of northwestern Middle-earth. Their distant ancestors are the Dunlendings who settled Eriador in the First Age. A portion of their people migrated across the Ered Luin and are counted among the Edain. In Eriador they settled countless villages, but their most well known establishment is Bree.",
                  features: [
                     "- Start the game with five bonus practice points. ",
                     "- It is easier for them to obtain Tharbad citizenship.",
                     "- Friendly inns throughout Arda treat them as locals when they rent.",
                     "- Low agility and a sneak penalty make them terrible thieves.",
                  ]
               },
               {
                  id: "rohir", key: "2", name: "Rohirrim", race: "man",
                  desc: "The Rohirrim are the Horse Lords of Rohan. Their name for themselves is the Eorlingas. They are tall, blond-haired, and often blue-eyed. They are by nature stern, fierce, and grave, yet generous. Their native language is Rohirric. Considered Middle Men by the Elves and Dúnedain, they founded few cities (their capital Edoras is the primary one) but rather have a nomadic culture built around horses. Their bravery and horsemanship are great assets in the war against evil.",
                  features: [
                     "- Start the game with a bonus in the Riding skill.",
                     "- With high Riding skill will never be thrown off their mounts.",
                     "- Will find their mounts to be less stubborn.",
                     "- Are particularly skilled with spears while riding.",
                  ]
               },
               {
                  id: "dunadan", key: "3", name: "Dúnadan", race: "man",
                  desc: "Men from Numenor, possessing longer life and preferring life as rangers, with an affinity for the wilderness.",
                  features: [
                     "- Age more slowly than other Men.",
                  ]
               },
               {
                  id: "beorning", key: "4", name: "Beorning", race: "man",
                  desc: "Beornings are fierce Men from the northern Vale of Anduin. They are rumored to descend from great mountain bears, or perhaps from the first Men who ever lived between the Misty Mountains and Greenwood the Great.",
                  features: [
                     "- Can shapeshift to bear form.",
                     "- Bears are stronger, have greater endurance and agility.",
                     "- Bear paws cause vicious damage, and they can bash their opponents.",
                     "- Bears cannot cast spells or wear most equipment.",
                     "- Start the game with a bonus in the Wilderness skill.",
                     "- Can forage for food and water while in bear form.",
                     "- Are empowered by the presence of powerful, friendly bears."
                  ],
                  restricted: "* For experienced players only."
               }
            ]
         },
         {
            id: "elf", key: "2", name: "Elf", plural: "Elves", army: "free",
            desc: "The first people of Middle-earth, created by Eru Ilúvatar. They are beautiful and strong, and immortal. Lúthien alone was the only Elf to have chosen to die from grief and to have left the world, back in the first terrible days of Arda.",
            hometowns: ["Tower Hills", "Grey Havens", "Rivendell", "Lorien"],
            features: [
               "- They are quick thinkers and therefore make good Magic users.",
               "- They can ride horses bareback without any penalties.",
               "- They can walk on top of snow, having no movement penalty.",
               "- They are immune to disease."
            ],
            subraces: [
               {
                  id: "noldo", key: "1", name: "Noldo", race: "elf",
               },
               {
                  id: "sinda", key: "2", name: "Sinda", race: "elf",
               },
               {
                  id: "silvan", key: "3", name: "Silvan", race: "elf",
               },
            ]
         },
         {
            id: "helf", key: "3", name: "Half-Elf", plural: "Half-Elves", army: "free",
            desc: "Back in the First Age of the Sun, Lúthien Tinúviel, the daughter of the Elven King Thingol, fell in love with the Man Beren. Lúthien's father disapproved of this and set Beren a seemingly impossible task of reclaiming one of the stolen Silmarils. Despite many perils, Lúthien joined Beren in this quest.  With the help of Huan the Hound of Valinor, they cut a Silmaril from the crown of Morgoth. Of them was born one child, the Half-elf Dior. The line would continue, with its decendants known as Half-Elves.",
            hometowns: ["Tower Hills", "Grey Havens", "Fornost", "Bree", "Rivendell", "Lorien"],
            features: [
               "- May select their hometown from both elf and human lands"
            ]
         },
         {
            id: "dwarf", key: "4", name: "Dwarf", plural: "Dwarves", army: "free",
            desc: "A tough and sturdy people, the creation of Mahal, the Vala Aulë.  Dwarves within MUME are in most respect identical to Tolkien's descriptions. Although short, they contain a great strength and hence can make excellent warriors. ",
            hometowns: ["Tower Hills", "Blue Mountains"],
            features: [
               "- Bonus with axes when standing with their feet firmly on the ground.",
               "- Can carry more weight without exhausting themselves.",
               "- Have difficulty riding horses, prefer mules and donkeys.",
               "- Low agility and a sneak penalty make them terrible thieves.",
            ]
         },
         {
            id: "hobbit", key: "5", name: "Hobbit", plural: "Hobbits", army: "free",
            desc: "Hobbits are a small folk, being about half the size of a man. They have leathery and furry feet resulting in most never wearing shoes. They are known as Halflings by the Humans, and the Periannath by the Elves.  They fear other races, treating them with superstition. However, they are a very-strong willed people, who when forced to fight can do so with vigour.",
            hometowns: ["Tower Hills", "The Shire", "Bree"],
            features: [
               "- They make ideal thieves with their quick reflexes and light bodies.",
               "- They are able to move and sneak better when barefoot.",
               "- Their furry feet with leathery soles provide some basic protection.",
               "- They are able to enter tiny holes that other races cannot fit into.",
               "- They suffer penalties when riding large mounts."
            ],
            subraces: [
               {
                  id: "stoor", key: "1", name: "Stoor", race: "hobbit",
               },
               {
                  id: "fallohid", key: "2", name: "Fallohid", race: "hobbit",
               },
               {
                  id: "harfoot", key: "3", name: "Harfoot", race: "hobbit",
               }
            ]
         },

         # forces of sauron
         {
            id: "torc", key: "1", name: "Tarkhnarb Orc", plural: "Tarkhnarb Orcs", army: "sauron",
            desc: "Also known as Goblins, these foul creatures were created by Morgoth in the First Age. Through his evil power, it is said he corrupted the beautiful Elves and transformed them into his servants of evil, the Orcs. They delight in seeing things suffer and bear malice especially to Elves and Dwarves. They are not intelligent and gain most of their destructive power in their large clans.",
            hometowns: ["Goblin Town"],
            features: [
               "- The only race with access to shaman spells.",
               "- Sunlight affects them badly, making them weak.",
               "- Ineffective vs light spells, taking more damage from them.",
               "- Ability to see in the dark without a light source.",
               "- Resistant to poisons, and less likely to be affected by them.",
               "- Reduced offensive bonuses when solo.",
               "- Increases their offensive bonuses when grouping with orcs."
            ],
            restricted: "* For experienced players only."
         },
         {
            id: "troll", key: "2", name: "Troll", plural: "Trolls", army: "sauron",
            desc: "Of all Sauron's servants, trolls have the greatest physical might. These huge figures may be the corrupted form of tree spirits, created by Morgoth in the Great Darkness. Trolls are normally incapable of withstanding the pureness of daylight. ",
            hometowns: ["The Warrens"],
            features: [
               "- Make great warriors, but have no access to spells or mana.",
               "- Can fight unarmed, dealing very heavy damage.",
               "- Have natural armour due to their thick hides.",
               "- Ability to see in the dark without a light source.",
               "- They suffer tremendous damage under sunlight.",
               "- Suffer permadeath if they burn to death from sunlight.",
               "- Have no access to shops.",
            ],
            subraces: [
               {
                  id: "cave", key: "1", name: "Cave", race: "troll",
                  restricted: "* For experienced players only."
               },
               {
                  id: "hill", key: "2", name: "Hill", race: "troll",
                  restricted: "* For experienced players only."
               },
               {
                  id: "mountain", key: "3", name: "Mountain", race: "troll",
                  restricted: "* For experienced players only."
               }
            ]
         },
         { 
            id: "bn", key: "3", name: "Black Númenórean", plural: "Black Númenóreans", army: "sauron",
            desc: "Lovers of power over lesser men, Black Númenóreans became corrupted by Sauron, coming to hate all good peoples. They settled in Middle-earth mainly in Umbar and surrounding coastal regions. ",
            hometowns: ["None"],
            features: [
               "- Have no cities in which they can rent.",
               "- Can camp rent outside away from enemy establishments.",
               "- They must wander in search of their guild masters.",
               "- Can not practice warrior skills at all.",
               "- Suffer depression from death and backfiring spells.",
               "- Upon death they return to a secret place.",
            ],
            restricted: "** For very experienced players only."
         },

         # renegade zaugurz
         {
            id: "zorc", key: "1", name: "Zaugurz", plural: "Zaugurz", army: "renegade",
            desc: "The Zaugurz have their home far up in the north, and are a tribe of hardened orcs who have little fear of the wintry cold of the Misty Mountains. The tribe is planning to expand their territory up north by a few wars against neighbouring tribes, and to make this possible they are constantly raiding for loot - metal, wood, leather - anything that can be used in warfare.  The Zaugurz have sworn to annihilate the Tarkhnarb tribe and their allies, the Black Númenóreans and the Trolls, as well as keeping the forces of the Free People at bay.",
            hometowns: ["Zaugurz Outpost"],
            features: [
               "- Make great warriors and scouts, but have no mana or access to spells.",
               "- Ability to see in the dark without a light source.",
               "- Sunlight affects them badly, making them weak.",
               "- Are ineffective vs light spells, taking more damage from them.",
               "- Are resistant to poisons, and less likely to be affected by them.",
               "- Have no shops to purchase gear, but may cart equipment for supplies.",
            ],
            restricted: "** For very experienced players only."
         }
      ]
   end
end