import 'package:flutter/material.dart';
import 'package:wisatajogja/screen/detail_screen.dart';
import 'package:wisatajogja/model/tourism_place.dart';
import 'package:wisatajogja/screen/profile_screen.dart';
import 'package:wisatajogja/screen/settings_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late List<TourismPlace> filteredPlaces;
  late TextEditingController _searchController;

  @override
  void initState() {
    super.initState();
    filteredPlaces = tourismPlaceList;
    _searchController = TextEditingController();
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
            _buildCategoryList(),
            const SizedBox(height: 10),
            Expanded(child: _buildTourismPlaceGrid()),
          ],
        ),
      ),
    );
  }

  Widget _buildTourismPlaceGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12),
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
                  // Icon bintang dan teks rating dipindahkan ke sisi kanan atas
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
                          place.rating.toString(), // Tampilkan rating
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildCategoryList() {
    return SizedBox(
      height: 40,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            _buildCategoryItem('Yogyakarta'),
            _buildCategoryItem('Sleman'),
            _buildCategoryItem('Bantul'),
            _buildCategoryItem('Kulon Progo'),
            _buildCategoryItem('Gunungkidul'),
            _buildCategoryItem('Magelang'),
            _buildCategoryItem('Solo'),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryItem(String cityName) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey[300],
      ),
      child: Text(cityName),
    );
  }

  void _onSearchTextChanged(String value) {
    setState(() {
      filteredPlaces = tourismPlaceList
          .where(
              (place) => place.name.toLowerCase().contains(value.toLowerCase()))
          .toList();
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
}
