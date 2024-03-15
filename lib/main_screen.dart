import 'package:flutter/material.dart';
import 'package:wisatajogja/detail_screen.dart';
import 'package:wisatajogja/model/tourism_place.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<TourismPlace> filteredPlaces;

  @override
  void initState() {
    super.initState();
    filteredPlaces = tourismPlaceList;
  }

  // void _filterPlaces(String query) {

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Apps'),
        backgroundColor: const Color.fromARGB(255, 198, 209, 226),
        actions: [
          IconButton(
            icon: const Icon(Icons.search,
                color: Color.fromARGB(255, 19, 18, 18)),
            onPressed: () {
              showSearch(context: context, delegate: PlaceSearchDelegate());
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 20, 20, 20)),
          onPressed: () {},
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          final TourismPlace place = filteredPlaces[index];
          return InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return DetailScreen(
                      place: place,
                    );
                  },
                ),
              );
            },
            child: Card(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Hero(
                      tag: place.name,
                      child: Image.asset(place.imageAsset),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(place.name,
                              style: TextStyle(
                                  fontSize: 16.0, fontWeight: FontWeight.bold)),
                          SizedBox(height: 10),
                          Text(place.location),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
        itemCount: filteredPlaces.length,
      ),
    );
  }
}

class PlaceSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text('No results found for "$query"'),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final List<TourismPlace> filteredPlaces = tourismPlaceList
        .where(
            (place) => place.name.toLowerCase().contains(query.toLowerCase()))
        .toList();

    return ListView.builder(
      itemCount: filteredPlaces.length,
      itemBuilder: (context, index) {
        final TourismPlace place = filteredPlaces[index];
        return ListTile(
          title: Text(place.name),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return DetailScreen(
                    place: place,
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
