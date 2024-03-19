import 'package:flutter/material.dart';
import 'package:wisatajogja/screen/detail_screen.dart';
import 'package:wisatajogja/model/tourism_place.dart';
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
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Settings(),
                ),
              );
            },
            icon: const Icon(Icons.settings),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const Settings(),
                  ),
                );
              },
              child: const CircleAvatar(
                backgroundImage: AssetImage('assets/farm-house.jpg'),
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
                  fillColor: Colors.grey[200],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: Colors.green,
                  ),
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
              child: Column(
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
