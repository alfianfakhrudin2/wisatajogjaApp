import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:wisatajogja/model/tourism_place.dart';
import 'package:wisatajogja/screen/detail_screen.dart';
import 'package:wisatajogja/screen/favorite_screen.dart';
import 'package:wisatajogja/screen/profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<TourismPlace> filteredPlaces;
  late TextEditingController _searchController;
  bool isSearching = false;
  int _currentSlide = 0;
  int _selectedIndex = 0;
  List<TourismPlace> favoritePlaces = [];

  @override
  void initState() {
    super.initState();
    filteredPlaces = tourismPlaceList;
    _searchController = TextEditingController();
    _loadFavoritePlaces(); // Load favorite places from SharedPreferences
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hello, Dean'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/freya.png'),
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: 'Search...',
                  filled: true,
                  fillColor: Theme.of(context).brightness == Brightness.light
                      ? Color.fromARGB(255, 255, 255, 255)
                      : Colors.black,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      color: const Color.fromARGB(
                          255, 224, 224, 224), // Warna border
                      width: 2.0, // Ketebalan border
                    ),
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.grey,
                  ),
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 10.0), // Atur ketinggian search bar
                ),
                onChanged: _onSearchTextChanged,
              ),
            ),
            if (!isSearching)
              _buildCarouselSlider(), // Tampilkan CarouselSlider jika tidak sedang mencari
            const SizedBox(height: 10),
            Expanded(child: _buildTourismPlaceGrid()),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onBottomNavigationItemTapped,
        selectedItemColor: const Color.fromARGB(
            255, 91, 163, 8), // Ubah warna ikon yang aktif menjadi hijau muda
      ),
    );
  }

  Widget _buildCarouselSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 16.0),
          child: Text(
            'Popular Places',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 8), // Spasi antara teks dan Carousel Slider
        CarouselSlider(
          options: CarouselOptions(
            height:
                150.0, // Ubah tinggi slider untuk memberikan ruang bagi bayangan
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 2.0,
            onPageChanged: (index, reason) {
              setState(() {
                _currentSlide = index;
              });
            },
            enableInfiniteScroll: true,
            autoPlayInterval: Duration(seconds: 3),
            autoPlayAnimationDuration: Duration(milliseconds: 800),
            autoPlayCurve: Curves.fastOutSlowIn,
            scrollDirection: Axis.horizontal,
            pauseAutoPlayOnTouch: true,
            pauseAutoPlayOnManualNavigate: true,
          ),
          items: filteredPlaces.map((place) {
            return Builder(
              builder: (BuildContext context) {
                return InkWell(
                  onTap: () => _navigateToDetailScreen(place),
                  child: Container(
                    height: 250,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // Perpindahan bayangan
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.circular(8.0), // Bulatkan sudut card
                      child: Stack(
                        alignment: Alignment.bottomLeft,
                        children: [
                          Image.asset(
                            place.imageAsset,
                            width: double.infinity,
                            height: 250,
                            fit: BoxFit.cover,
                          ),
                          Container(
                            padding: EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black.withOpacity(0.7),
                                ],
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: Colors.white,
                                      size: 16,
                                    ),
                                    SizedBox(width: 4),
                                    Text(
                                      place.location,
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 4),
                                Text(
                                  place.name,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Positioned(
                            top: 8,
                            right: 8,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                  size: 16,
                                ),
                                SizedBox(width: 4),
                                Text(
                                  place.rating.toString(),
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        SizedBox(height: 8), // Spasi antara CarouselSlider dan indikator
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: filteredPlaces.map((place) {
            int index = filteredPlaces.indexOf(place);
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              child: Container(
                width: _currentSlide == index ? 16.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentSlide == index ? Colors.blue : Colors.grey,
                ),
              ),
            );
          }).toList(),
        ),
        SizedBox(height: 8), // Spasi antara indikator dan konten lainnya
      ],
    );
  }

  Widget _buildTourismPlaceGrid() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            'Recommended for You',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(height: 12),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: filteredPlaces.length,
              itemBuilder: (context, index) {
                final place = filteredPlaces[index];
                return InkWell(
                  onTap: () => _navigateToDetailScreen(place),
                  child: Card(
                    child: Stack(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              place.imageAsset,
                              width: double.infinity,
                              height: 120,
                              fit: BoxFit.cover,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    place.name,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(place.location),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          top: 8,
                          right: 8,
                          child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    if (favoritePlaces
                                        .contains(filteredPlaces[index])) {
                                      favoritePlaces
                                          .remove(filteredPlaces[index]);
                                    } else {
                                      favoritePlaces.add(filteredPlaces[index]);
                                    }
                                  });
                                  _saveFavoritePlaces(); // Save favorite places after modification
                                },
                                child: Icon(
                                  favoritePlaces.contains(filteredPlaces[index])
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  color: Colors.red,
                                  size: 16,
                                ),
                              ),
                              SizedBox(width: 4),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  void _onSearchTextChanged(String value) {
    setState(() {
      // Periksa apakah teks pencarian tidak kosong
      if (value.isNotEmpty) {
        // Jika teks pencarian tidak kosong, atur isSearching menjadi true
        isSearching = true;
        // Filter daftar tempat berdasarkan teks pencarian
        filteredPlaces = tourismPlaceList
            .where((place) =>
                place.name.toLowerCase().contains(value.toLowerCase()))
            .toList();
      } else {
        // Jika teks pencarian kosong, atur isSearching menjadi false dan tampilkan kembali semua tempat wisata
        isSearching = false;
        filteredPlaces = tourismPlaceList;
      }
    });
  }

  void _navigateToDetailScreen(TourismPlace place) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailScreen(place: place),
      ),
    );
  }

  void _onBottomNavigationItemTapped(int index) {
    setState(() {
      if (index == 1) {
        // If the favorite icon is clicked, navigate to the favorite screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => FavoriteScreen(
              // Pass favoritePlaces from the current state
              favoritePlaces: favoritePlaces,
            ),
          ),
        );
      } else {
        // For other icons, update the bottom navigation index
        _selectedIndex = index;
      }
    });
  }

  // Load favorite places from SharedPreferences
  void _loadFavoritePlaces() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('favoritePlaces')) {
      List<String> favoritePlacesJson = prefs.getStringList('favoritePlaces')!;
      favoritePlaces = favoritePlacesJson
          .map((placeJson) => TourismPlace.fromJson(json.decode(placeJson)))
          .toList();
    }
  }

  // Save favorite places to SharedPreferences
  void _saveFavoritePlaces() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> favoritePlacesJson =
        favoritePlaces.map((place) => json.encode(place.toJson())).toList();
    prefs.setStringList('favoritePlaces', favoritePlacesJson);
  }
}
