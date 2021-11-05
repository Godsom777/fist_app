class Game {
  final String image;
  final String title;
  final String description;

  Game(this.image, this.title, this.description);
}

/////16 total
final List<Game> games = [
  Game('images/(9).jpeg', 'KillZone', 'Activision Games 2021'),
  Game('images/(8).jpeg', 'Mass Effect', 'Konami'),
  Game('images/(7).jpeg', 'Video Game ', 'GameLoft'),
  Game('images/(11).jpeg', 'Epic Battle ', 'BadBoys Inc'),
  Game('images/(12).jpeg', 'Desert Rush ', 'Sega'),
  Game('images/(13).jpeg', 'Fortnite 3 ', 'EndingMan'),
  Game('images/(14).jpeg', 'Fortnite 1', 'PlayStation Games ltd'),
  Game('images/(2).jpeg', 'Top Games ', 'XBox 360'),
  Game('images/(1).jpeg', 'Fortnite ', 'X-Box One'),
  Game('images/(1).jpg', 'Brothers in Arms ', 'Activision Games 2021'),
  Game('images/(2).jpg', 'Into The wild', 'Activision Games 2021'),
  Game('images/(10).jpeg', 'Game Pack ', 'Activision Games 2021'),
  Game('images/(6).jpeg', 'Mario Kart ', 'Activision Games 2021'),
  Game('images/(12).jpeg', 'Space Mission', 'Activision Games 2021'),
  Game('images/(13).jpeg', 'Super Smashers ', 'Activision Games 2021'),
  Game('images/(3).jpeg', 'Zelda', 'Activision Games 2021'),
];

class Time {
  final String time;
  final String tod;

  Time(this.time, this.tod);
}

final List<Time> time = [
  Time('21:12', 'Yesterday'),
  Time('7:17', 'today'),
  Time('08:41', 'Recently'),
  Time('09:32', '07/03/2021'),
  Time('12:10', '08/04/2021'),
  Time('10:02', '12/01/2021'),
];

class Discover {
  final String genre;

  Discover(this.genre);
}

final List genre = [
  ('Just for you'),
  ('Favorites'),
  ('Hot'),
  ('New'),
  ('Puzzle'),
  ('Arcade'),
  ('Sports'),
  ('One Hand'),
  ('Dragging'),
];
