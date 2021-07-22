import 'package:flutter/material.dart';

class MembershipDetails extends StatefulWidget {
  final int id;
  final String title;
  final double price;
  final String image;

  MembershipDetails({this.id, this.title, this.image, this.price});

  @override
  _MembershipDetailsState createState() => _MembershipDetailsState();
}

class _MembershipDetailsState extends State<MembershipDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(),
      ),
    );
  }
}
