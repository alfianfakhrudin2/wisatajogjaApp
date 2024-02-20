import 'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Wisata Apps'),
        // theme: ThemeData(),
        // centerTitle: true,
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
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Image.asset('assets/bosscha.jpg'),

              // ElevatedButton(
              //   onPressed: () {
              //     Navigator.pop(context);
              //   },
              //   child: const Text('Go to First Screen'),
              // ),
              Container(
                  margin: const EdgeInsets.only(top: 16.0),
                  child: const Text(
                    'Go to First Screen',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 20, 20, 20),
                    ),
                  )),

              Container(
                margin: const EdgeInsets.symmetric(vertical: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: const <Widget>[
                        Icon(Icons.calendar_today),
                        SizedBox(
                          // Use of SizedBox
                          height: 8.0,
                        ),
                        Text('Open Everyday'),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.access_time_rounded),
                        SizedBox(
                          // Use of SizedBox
                          height: 8.0,
                        ),
                        Text('09:00 - 20:00'),
                      ],
                    ),
                    Column(
                      children: const <Widget>[
                        Icon(Icons.monetization_on_rounded),
                        SizedBox(
                          // Use of SizedBox
                          height: 8.0,
                        ),
                        Text('Rp 25.000,-'),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  'Wisata ini merupakan tempat wisata yang sangat indah dan menarik untuk dikunjungi. Wisata ini merupakan tempat wisata yang sangat indah dan menarik untuk dikunjungi. Wisata ini merupaka Wisata ini merupakan tempat wisata yang sangat indah dan menarik untuk dikunjungi.',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 20, 20, 20),
                  ),
                ),
              ),
              Image.network(
                  'https://media-cdn.tripadvisor.com/media/photo-s/0d/7c/59/70/farmhouse-lembang.jpg')
            ]),
      )
          // child: ElevatedButton(
          //   onPressed: () {
          //     Navigator.push(context);
          //   },
          //   child: const Text('Go to Second Screen'),
          // ),
          ),
    );
  }
}
