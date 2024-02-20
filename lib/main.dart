import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'wisarta',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      home: const FirstScreen(),
    );
  }
}

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
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
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
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Color.fromARGB(255, 20, 20, 20),
                  ),
                ),
              )
            ]),
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

// class DetailScreen extends StatelessWidget {
//   const DetailScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           const Text('Second Screen'),
//           ElevatedButton(
//             onPressed: () {
//               Navigator.pop(context);
//             },
//             child: const Text('Go to First Screen'),
//           ),
//         ],
//         // child: ElevatedButton(
//         //   onPressed: () {
//         //     Navigator.pop(context);
//         //   },
//         //   child: const Text('Go to First Screen'),
//         // ),
//       ),
//     );
//   }
// }
