# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# STILL DO DO: have password be passed in once we have the "has secure password" stuff set up, right now it will break

users = 30.times.map do
  User.create!(username: Faker::Internet.user_name, first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, password: 'password', image_url: ["https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/alana.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/catie.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/dan.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/eddiy.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/marshall.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/jim.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/jelliotartz.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/ray.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/mikevolley.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/mike.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/meagan.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/tyler.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/tiff.jpg", "https://raw.githubusercontent.com/tomorrow-lauren/lauren-doodle/master/jpg/sabri.jpg"].sample)
end

all_users = []
all_users.concat(users)

friendships = 25.times do
  user_1 = all_users.pop
  3.times do
    Friendship.create!(friend_1_id: user_1.id, friend_2_id: all_users.sample.id)
  end
end

games_to_seed = [{
    name: "Talon",
    image_url: "//cf.geekdo-images.com/images/pic2661579_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Quadropolis",
    image_url: "//cf.geekdo-images.com/images/pic2840020_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Blacksmith Brothers",
    image_url: "//cf.geekdo-images.com/images/pic2906526_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Deathwatch: Overkill",
    image_url: "//cf.geekdo-images.com/images/pic2907096_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Star Wars: Rebellion",
    image_url: "//cf.geekdo-images.com/images/pic2737530_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "The Goonies: Adventure Card Game",
    image_url: "//cf.geekdo-images.com/images/pic2913950_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Santorini",
    image_url: "//cf.geekdo-images.com/images/pic2915881_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Darklight: Memento Mori",
    image_url: "//cf.geekdo-images.com/images/pic2894555_t.png",
    release_year: 2017,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Blood Rage",
    image_url: "//cf.geekdo-images.com/images/pic2439223_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Heart of Crown",
    image_url: "//cf.geekdo-images.com/images/pic1473283_t.jpg",
    release_year: 2011,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Pandemic Legacy: Season 1",
    image_url: "//cf.geekdo-images.com/images/pic2452831_t.png",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Through the Ages: A New Story of Civilization",
    image_url: "//cf.geekdo-images.com/images/pic2663291_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "T.I.M.E Stories",
    image_url: "//cf.geekdo-images.com/images/pic2617634_t.png",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {

    name: "Star Wars: Imperial Assault",
    image_url: "//cf.geekdo-images.com/images/pic2247647_t.jpg",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Kingdom Death: Monster",
    image_url: "//cf.geekdo-images.com/images/pic2481445_t.png",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Condottiere",
    image_url: "//cf.geekdo-images.com/images/pic239843_t.jpg",
    release_year: 1995,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Masmorra: Dungeons of Arcadia",
    image_url: "//cf.geekdo-images.com/images/pic2869709_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Warhammer Quest: The Adventure Card Game",
    image_url: "//cf.geekdo-images.com/images/pic2625794_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Liberty or Death: The American Insurrection",
    image_url: "//cf.geekdo-images.com/images/pic2729630_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Council of Four",
    image_url: "//cf.geekdo-images.com/images/pic2648492_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Food Chain Magnate",
    image_url: "//cf.geekdo-images.com/images/pic2649434_t.png",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Codenames",
    image_url: "//cf.geekdo-images.com/images/pic2582929_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Too Many Bones",
    image_url: "//cf.geekdo-images.com/images/pic2864170_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Arcadia Quest",
    image_url: "//cf.geekdo-images.com/images/pic2305263_t.jpg",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "The Lord of the Rings: The Card Game",
    image_url: "//cf.geekdo-images.com/images/pic906495_t.jpg",
    release_year: 2011,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Mage Knight Board Game",
    image_url: "//cf.geekdo-images.com/images/pic1083380_t.jpg",
    release_year: 2011,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "The Castles of Burgundy: The Card Game",
    image_url: "//cf.geekdo-images.com/images/pic2844943_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Eldritch Horror",
    image_url: "//cf.geekdo-images.com/images/pic1872452_t.jpg",
    release_year: 2013,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Terra Mystica",
    image_url: "//cf.geekdo-images.com/images/pic1356616_t.jpg",
    release_year: 2012,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Twilight Struggle",
    image_url: "//cf.geekdo-images.com/images/pic361592_t.jpg",
    release_year: 2005,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Robinson Crusoe: Adventures on the Cursed Island",
    image_url: "//cf.geekdo-images.com/images/pic1413154_t.jpg",
    release_year: 2012,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Glass Road",
    image_url: "//cf.geekdo-images.com/images/pic2499302_t.jpg",
    release_year: 2013,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "7 Wonders: Duel",
    image_url: "//cf.geekdo-images.com/images/pic2576399_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "The Castles of Burgundy",
    image_url: "//cf.geekdo-images.com/images/pic1176894_t.jpg",
    release_year: 2011,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Dead of Winter: A Crossroads Game",
    image_url: "//cf.geekdo-images.com/images/pic2221472_t.jpg",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "The Red Dragon Inn: Battle for Greyport",
    image_url: "//cf.geekdo-images.com/images/pic2908170_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Mystic Vale",
    image_url: "//cf.geekdo-images.com/images/pic2913813_t.jpg",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Onitama",
    image_url: "//cf.geekdo-images.com/images/pic2904046_t.png",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "The Voyages of Marco Polo",
    image_url: "//cf.geekdo-images.com/images/pic2461346_t.png",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Zombicide: Black Plague",
    image_url: "//cf.geekdo-images.com/images/pic2482309_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Archaeology: The New Expedition",
    image_url: "//cf.geekdo-images.com/images/pic2805898_t.png",
    release_year: 2016,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Legendary: A Marvel Deck Building Game",
    image_url: "//cf.geekdo-images.com/images/pic1430769_t.jpg",
    release_year: 2012,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Shadows of Brimstone: City of the Ancients",
    image_url: "//cf.geekdo-images.com/images/pic2037825_t.jpg",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Grand Austria Hotel",
    image_url: "//cf.geekdo-images.com/images/pic2728138_t.jpg",
    release_year: 2015,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Patchwork",
    image_url: "//cf.geekdo-images.com/images/pic2270442_t.jpg",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Star Wars: X-Wing Miniatures Game",
    image_url: "//cf.geekdo-images.com/images/pic1603292_t.jpg",
    release_year: 2012,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Caverna: The Cave Farmers",
    image_url: "//cf.geekdo-images.com/images/pic1790789_t.jpg",
    release_year: 2013,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "7 Wonders",
    image_url: "//cf.geekdo-images.com/images/pic860217_t.jpg",
    release_year: 2010,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Onward to Venus",
    image_url: "//cf.geekdo-images.com/images/pic1993102_t.jpg",
    release_year: 2014,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  },
  {
    name: "Keyflower",
    image_url: "//cf.geekdo-images.com/images/pic2278942_t.jpg",
    release_year: 2012,
    player_range: '1-4',
    play_time: '45-60 minutes',
    description:Faker::Hipster.paragraph(4),
    publisher: 'Ray',
    creator_id: users.sample.id
  }
]

Game.create!(games_to_seed)
games = Game.all
users = User.all.to_a

collections = 30.times.map do
  user_id = users.pop.id
  5.times do
    Collection.create!(user_id: user_id, game_id: games.sample.id)
  end
end

users = User.all

comments = 200.times.map do
  Comment.create!(commenter_id: users.sample.id, game_id: games.sample.id, text: Faker::Hacker.say_something_smart)
end


votes = 300.times.map do
  Vote.create!(voter_id: users.sample.id, game_id: games.sample.id, value: [-1,1].sample)
end

tags_for_seeding =[
{name: "Acting"},
{name: "Action / Movement Programming"},
{name: "Action Point Allowance System"},
{name: "Area Control / Area Influence"},
{name: "Area Enclosure"},
{name: "Area Movement"},
{name: "Area-Impulse"},
{name: "Auction/Bidding"},
{name: "Betting/Wagering"},
{name: "Campaign / Battle Card Driven"},
{name: "Card Drafting"},
{name: "Chit-Pull System"},
{name: "Co-operative Play"},
{name: "Commodity Speculation"},
{name: "Crayon Rail System"},
{name: "Deck / Pool Building"},
{name: "Dice Rolling"},
{name: "Grid Movement"},
{name: "Hand Management"},
{name: "Hex-and-Counter"},
{name: "Line Drawing"},
{name: "Memory"},
{name: "Modular Board"},
{name: "Paper-and-Pencil"},
{name: "Partnerships"},
{name: "Pattern Building"},
{name: "Pattern Recognition"},
{name: "Pick-up and Deliver"},
{name: "Player Elimination"},
{name: "Point to Point Movement"},
{name: "Press Your Luck"},
{name: "Rock-Paper-Scissors"},
{name: "Role Playing"},
{name: "Roll / Spin and Move"},
{name: "Route/Network Building"},
{name: "Secret Unit Deployment"},
{name: "Set Collection"},
{name: "Simulation"},
{name: "Simultaneous Action Selection"},
{name: "Singing"},
{name: "Stock Holding"},
{name: "Storytelling"},
{name: "Take That"},
{name: "Tile Placement"},
{name: "Time Track"},
{name: "Trading"},
{name: "Trick-taking"},
{name: "Variable Phase Order"},
{name: "Variable Player Powers"},
{name: "Voting"},
{name: "Worker Placement"}]

Tag.create!(tags_for_seeding)

tags = Tag.all

100.times do
  Tagging.create(game_id: games.sample.id, tag_id: tags.sample.id)
end

categories_for_seeding = [
{name: "Abstract Strategy"},
{name: "Action / Dexterity"},
{name: "Adventure"},
{name: "Age of Reason"},
{name: "American Civil War"},
{name: "American Indian Wars"},
{name: "American Revolutionary War"},
{name: "American West"},
{name: "Ancient"},
{name: "Animals"},
{name: "Arabian"},
{name: "Aviation / Flight"},
{name: "Bluffing"},
{name: "Book"},
{name: "Card Game"},
{name: "Children's Game"},
{name: "City Building"},
{name: "Civil War"},
{name: "Civilization"},
{name: "Collectible Components"},
{name: "Comic Book / Strip"},
{name: "Deduction"},
{name: "Dice"},
{name: "Economic"},
{name: "Educational"},
{name: "Electronic"},
{name: "Environmental"},
{name: "Expansion for Base-game"},
{name: "Exploration"},
{name: "Fan Expansion"},
{name: "Fantasy"},
{name: "Farming"},
{name: "Fighting"},
{name: "Game System"},
{name: "Horror"},
{name: "Humor"},
{name: "Industry / Manufacturing"},
{name: "Korean War"},
{name: "Mafia"},
{name: "Math"},
{name: "Mature / Adult"},
{name: "Maze"},
{name: "Medical"},
{name: "Medieval"},
{name: "Memory"},
{name: "Miniatures"},
{name: "Modern Warfare"},
{name: "Movies / TV / Radio theme"},
{name: "Murder/Mystery"},
{name: "Music"},
{name: "Mythology"},
{name: "Napoleonic"},
{name: "Nautical"},
{name: "Negotiation"},
{name: "Novel-based"},
{name: "Number"},
{name: "Party Game"},
{name: "Pike and Shot"},
{name: "Pirates"},
{name: "Political"},
{name: "Post-Napoleonic"},
{name: "Prehistoric"},
{name: "Print & Play"},
{name: "Puzzle"},
{name: "Racing"},
{name: "Real-time"},
{name: "Religious"},
{name: "Renaissance"},
{name: "Science Fiction"},
{name: "Space Exploration"},
{name: "Spies/Secret Agents"},
{name: "Sports"},
{name: "Territory Building"},
{name: "Trains"},
{name: "Transportation"},
{name: "Travel"},
{name: "Trivia"},
{name: "Video Game Theme"},
{name: "Vietnam War"},
{name: "Wargame"},
{name: "Word Game"},
{name: "World War I"},
{name: "World War II"},
{name: "Zombies"}]

Category.create!(categories_for_seeding)

categories = Category.all

100.times do
  Categorization.create(game_id: games.sample.id, category_id: categories.sample.id)
end
