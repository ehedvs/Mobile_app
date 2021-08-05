import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:qrcode/api_control.dart';

// import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const appTitle = 'EHECVS';

    return const MaterialApp(
      title: appTitle,
      home: MyHomePage(title: appTitle),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: FutureBuilder(
        future: fetchGraduates(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) return PhotosList(photos: snapshot.data!);
          return Container(
              child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(20)),
              Text("This App is working for Only Genuine Certificates"),
            ],
          ));
        },
      ),
    );
  }
}

class PhotosList extends StatelessWidget {
  const PhotosList({Key? key, required this.photos}) : super(key: key);

  final List<Graduate> photos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {
              print(photos[index].thumbnailUrl);
              return Container(
                child: Column(
                  children: [
                    Image.network(
                        'http://10.240.72.149:8000${photos[index].thumbnailUrl}'),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Text(photos[index].title),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Text(photos[index].id.toString()),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    Text(
                        "Graduated from Adama Science And Technology University"),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    Text("School of Electrical Engineering and computing"),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    Text("Computer Science and Engineering"),
                    Padding(
                      padding: const EdgeInsets.all(0.0),
                    ),
                    Text("Has GPA 3.6"),
                    Padding(
                      padding: const EdgeInsets.all(70.0),
                    )
                  ],
                ),
              );
            }));
  }
}
