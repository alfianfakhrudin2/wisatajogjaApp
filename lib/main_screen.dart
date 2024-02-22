import 'package:flutter/material.dart';
import 'package:wisatajogja/detail_screen.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

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
              print('More');
            },
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.menu, color: Color.fromARGB(255, 20, 20, 20)),
          onPressed: () {
            print('Search');
          },
        ),
      ),
    );
  }
}
