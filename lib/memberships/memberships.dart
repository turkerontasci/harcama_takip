class SelectedMemberShips {
  int id;
  String title;
  double price;
  String image;
  int categoryID;
  String category;
  DateTime date;

  SelectedMemberShips({
    this.id,
    this.title,
    this.price,
    this.image,
    this.date,
    this.categoryID,
    this.category,
  });
}

List memberships = [
  {
    "id": 1,
    "title": "Spotify Premium",
    "price": 39.90,
    "image": "images/spotifylogo.png",
    "date": DateTime(
      2021,
      7,
      22,
    ),
    "category": "Music",
    "categoryID": 1,
  },
  {
    "id": 2,
    "title": "Netflix",
    "price": 39.90,
    "image": "images/netflixlogo.png",
    "date": DateTime(
      2021,
      7,
      23,
    ),
    "category": "Movie & Show",
    "categoryID": 2,
  },
  {
    "id": 3,
    "title": "Disney+",
    "price": 14.90,
    "image": "images/disneypluslogo.jpeg",
    "date": DateTime(
      2021,
      7,
      26,
    ),
    "category": "Movie & Show",
    "categoryID": 2,
  },
  {
    "id": 4,
    "title": "Prime Video",
    "price": 8.90,
    "image": "images/amazonprimelogo.jpeg",
    "date": DateTime(
      2021,
      7,
      31,
    ),
    "category": "Movie & Show",
    "categoryID": 2,
  },
  {
    "id": 5,
    "title": "Twitch Sub",
    "price": 9.90,
    "image": "images/twitchlogo.jpeg",
    "date": DateTime(
      2021,
      8,
      13,
    ),
    "category": "Streaming",
    "categoryID": 3,
  },
  {
    "id": 6,
    "title": "XBOX Game Pass",
    "price": 9.90,
    "image": "images/xboxlogo.png",
    "date": DateTime(
      2021,
      8,
      12,
    ),
    "category": "Game",
    "categoryID": 4,
  },
  {
    "id": 7,
    "title": "PlayStation",
    "price": 9.90,
    "image": "images/psnlogo.png",
    "date": DateTime(
      2021,
      8,
      12,
    ),
    "category": "Game",
    "categoryID": 4,
  },
  {
    "id": 8,
    "title": "Apple Music",
    "price": 9.90,
    "image": "images/applemusiclogo.png",
    "date": DateTime(
      2021,
      8,
      12,
    ),
    "category": "Music",
    "categoryID": 1,
  },
  {
    "id": 9,
    "title": "Deezer Premium",
    "price": 9.90,
    "image": "images/deezerlogo.png",
    "date": DateTime(
      2021,
      8,
      12,
    ),
    "category": "Music",
    "categoryID": 1,
  }
];
