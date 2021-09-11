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
  },
  {
    "id": 2,
    "title": "Fatura",
    "iconData": Icons.payments,
  },
  {
    "id": 3,
    "title": "Market",
    "iconData": Icons.shopping_cart,
  },
  {
    "id": 4,
    "title": "Eğlence",
    "iconData": Icons.movie_filter_outlined,
  },
  {
    "id": 5,
    "title": "Giyim",
    "iconData": Icons.dry_cleaning,
  },
  {
    "id": 6,
    "title": "Elektronik",
    "iconData": Icons.laptop_windows,
  },
  {
    "id": 7,
    "title": "Ulaşım",
    "iconData": Icons.train,
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
