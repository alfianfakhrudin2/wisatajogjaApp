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
      body: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return FirstScreen();
          }));
        },
        child: Card(
          child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Image.asset('assets/bosscha.jpg'),
                Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Image.asset('assets/bosscha.jpg'),
                        ),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text('Bosscha Observatory',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                                SizedBox(height: 10),
                                Text('Lembang, Bandung',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16)),
                              ],
                            ),
                          ),
                        )
                      ],
                    )),
              ]),
        ),
      ),
    );
  }
}
