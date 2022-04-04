import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ngontrakkan/model/house_place.dart';
import 'dart:math' as math;

var informationTextStyle =
    TextStyle(fontFamily: 'EuclidCircularA-Regular', color: Colors.black);

class DetailScreen extends StatelessWidget {
  final HousePlace place;

  DetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30),
                        bottomLeft: Radius.circular(30)),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(place.imageAsset),
                    ),
                  ),
                ),
                SafeArea(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(Icons.arrow_back, size: 31),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                      FavoriteButton(),
                    ],
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 16.0, left: 20, right: 20),
              child: Text(
                place.name,
                textAlign: TextAlign.justify,
                style: TextStyle(
                  fontSize: 30.0,
                  fontFamily: 'EuclidCircularA-Regular',
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(5.0),
              child: ExpansionTile(
                title: Text(
                  "Descriptions",
                  style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                ),
                children: <Widget>[
                  ListTile(
                    title: Container(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        place.description,
                        textAlign: TextAlign.justify,
                        style: TextStyle(
                          fontSize: 16.0,
                          fontFamily: 'EuclidCircularA-Regular',
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Icon(Icons.calendar_today),
                      SizedBox(height: 8.0),
                      Text(
                        place.openDays,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                  Column(
                    children: <Widget>[
                      Icon(Icons.monetization_on),
                      SizedBox(height: 8.0),
                      Text(
                        place.ticketPrice,
                        style: informationTextStyle,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 160,
              padding: EdgeInsets.only(left: 15.0),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: place.imageUrls.map((url) {
                  return Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(url, fit:BoxFit.cover, width: 240, height: 220),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class FavoriteButton extends StatefulWidget {
  @override
  _FavoriteButtonState createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: Colors.red,
      ),
      onPressed: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
    );
  }
}
