import 'package:flutter/material.dart';

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

List expenses = [
  {
    "id": 1,
    "title": "Yemek",
    "iconData": Icons.fastfood,
    "color": Color(0xCDF8B96D),
  },
  {
    "id": 2,
    "title": "Fatura",
    "iconData": Icons.payments,
    "color": Color(0x90FF9393),
  },
  {
    "id": 3,
    "title": "Market",
    "iconData": Icons.shopping_cart,
    "color": Color(0x909090FF),
  },
  {
    "id": 4,
    "title": "Eğlence",
    "iconData": Icons.movie_filter_outlined,
    "color": Color(0x907DE4FF),
  },
  {
    "id": 5,
    "title": "Giyim",
    "iconData": Icons.dry_cleaning,
    "color": Color(0x90FC59BA),
  },
  {
    "id": 6,
    "title": "Elektronik",
    "iconData": Icons.laptop_windows,
    "color": Color(0x909FF3A0),
  },
  {
    "id": 7,
    "title": "Ulaşım",
    "iconData": Icons.train,
    "color": Color(0xA6FF8C70),
  }
];

List memberships = [
  {
    "id": 1,
    "title": "Spotify Premium",
    "price": 39.90,
    "image": "images/spotifylogo.png",
    "category": "Music",
    "categoryID": 1,
  },
  {
    "id": 2,
    "title": "Netflix",
    "price": 39.90,
    "image": "images/netflixlogo.png",
    "category": "Movie & Show",
    "categoryID": 2,
  },
  {
    "id": 3,
    "title": "Disney+",
    "price": 14.90,
    "image": "images/disneypluslogo.jpeg",
    "category": "Movie & Show",
    "categoryID": 2,
  },
  {
    "id": 4,
    "title": "Prime Video",
    "price": 8.90,
    "image": "images/amazonprimelogo.jpeg",
    "category": "Movie & Show",
    "categoryID": 2,
  },
  {
    "id": 5,
    "title": "Twitch Sub",
    "price": 9.90,
    "image": "images/twitchlogo.jpeg",
    "category": "Streaming",
    "categoryID": 3,
  },
  {
    "id": 6,
    "title": "XBOX Game Pass",
    "price": 9.90,
    "image": "images/xboxlogo.png",
    "category": "Game",
    "categoryID": 4,
  },
  {
    "id": 7,
    "title": "PlayStation",
    "price": 9.90,
    "image": "images/psnlogo.png",
    "category": "Game",
    "categoryID": 4,
  },
  {
    "id": 8,
    "title": "Apple Music",
    "price": 9.90,
    "image": "images/applemusiclogo.png",
    "category": "Music",
    "categoryID": 1,
  },
  {
    "id": 9,
    "title": "Deezer Premium",
    "price": 9.90,
    "image": "images/deezerlogo.png",
    "category": "Music",
    "categoryID": 1,
  }
];
