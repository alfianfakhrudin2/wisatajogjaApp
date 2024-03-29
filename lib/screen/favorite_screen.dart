import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wisatajogja/model/tourism_place.dart';
import 'package:wisatajogja/screen/detail_screen.dart';

class FavoriteScreen extends StatefulWidget {
  final List<TourismPlace> favoritePlaces;

  const FavoriteScreen({Key? key, required this.favoritePlaces})
      : super(key: key);

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  late List<TourismPlace> favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    favoritePlaces = widget.favoritePlaces;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorite Places'),
      ),
      body: ListView.builder(
        itemCount: favoritePlaces.length,
        itemBuilder: (context, index) {
          final place = favoritePlaces[index];
          return ListTile(
            onTap: () => _navigateToDetailScreen(place),
            leading: Image.asset(
              place.imageAsset,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            title: Text(place.name),
            subtitle: Text(place.location),
            trailing: IconButton(
              icon: Icon(Icons.favorite, color: Colors.red),
              onPressed: () {
                _removeFromFavorites(place);
              },
            ),
          );
        },
      ),
    );
  }

  void _navigateToDetailScreen(TourismPlace place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(place: place),
      ),
    );
  }

  void _removeFromFavorites(TourismPlace place) {
    setState(() {
      favoritePlaces.remove(place);
    });
    _saveFavoritePlaces();
  }

  Future<void> _saveFavoritePlaces() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String encodedPlaces = jsonEncode(favoritePlaces);
    prefs.setString('favorite_places', encodedPlaces);
  }
}
