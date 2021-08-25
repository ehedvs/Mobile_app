// import 'package:check_mobile_app/main.dart';
// import 'package:flutter/material.dart';
// import 'package:check_mobile_app/api_control.dart';

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);

//   final String title;

//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
  

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//         centerTitle: true,
        
//         leading: new IconButton(
//         icon: new Icon(Icons.arrow_back, color: Colors.orange),
//         onPressed: () => Navigator.of(context).pop(),
// ), 
//       ),
//       body: FutureBuilder(
//         future: fetchGraduates(),
//         builder: (context, AsyncSnapshot snapshot) {
//           if (snapshot.hasData) return PhotosList(photos: snapshot.data!);
//           // print(snapshot.data);
//           return Container(
            
//               child: Column(
//                 children: [
//                   Center(
                    
//                     child: Column(
//                       children: [
//                         Card(
//                           child:
//                           Column(
//                             children: [
//                               Card(
//                                 child: Column(
//                                   children: [
//                                     CircleAvatar(backgroundImage: AssetImage("asset/OIP2.jpg"), radius: 100,),
//                               // Padding(padding: EdgeInsets.all(50)),
//                                   ],
//                                 )
//                               ),
//                               Padding(padding: EdgeInsets.all(30)),
//                               SizedBox(
//                                 child: Text("This is not genuine certificate please check it again", style: TextStyle(color: Colors.black87, fontSize: 20),),
//                                 width: 300,
                                
//                               )
                               
//                             ],
//                         ),
//                     ),
//                       ]),
//                   ),
//                 ],
//           ));
//         },
//       ),
//     );
//   }
// }

// class PhotosList extends StatelessWidget {
//   const PhotosList({Key? key, required this.photos}) : super(key: key);

//   final List<Graduate> photos;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Card(
//           child:ListView.builder(
//             itemCount: photos.length,
//             itemBuilder: (context, index) {

//               // print(photos[index].thumbnailUrl);
//               // print(photos[index].thumbnailUrl);
//               return Container(
                
//                 child: Column(
                  
//                   children: [
                    
                    
//                           CircleAvatar(
//                       backgroundImage: NetworkImage('${photos[index].thumbnailUrl}'),
//                       radius: 150,  
//                     ),
                    
                    
//                     Card(
//                       child: Text(
//                         photos[index].fullname, textAlign : TextAlign.center,style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(30.0),
//                     ),
//                     Text("Graduation Date:--"+photos[index].date, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
//                     Padding(
//                       padding: const EdgeInsets.all(50.0),
//                     ),
//                     Text("Graduation Date:--"+photos[index].student, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
//                     Padding(
//                       padding: const EdgeInsets.all(50.0),
//                     ),
//                     Card(
//                       child: Column(
//                         children: [
//                           Text( photos[index].institution, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17)),
//                           Padding(
//                             padding: const EdgeInsets.all(10.0),
//                                  ),
//                           Text(photos[index].school,style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 15)),
//                         ],
//                       ),
                      
//                     ),
                    
//                     Padding(
//                       padding: const EdgeInsets.all(10.0),
//                     ),
//                     Text(photos[index].dept, style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 15)),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                     ),
//                     Text("GPA:---"+photos[index].gpa, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                     ),
//                     Text("CGPA:---"+photos[index].cgpa, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
//                     Padding(
//                       padding: const EdgeInsets.all(20.0),
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                       child: Text('Open route'),
//                       onPressed: () {
//                         Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyApp()),
//                     );
//                     },
//                     ),
//                     ),
//                     SizedBox(
//                       width : 300, 
//                       height : 700, 
//                       child : Column(
//                         children: [
//                           CircleAvatar(
//                              backgroundImage: AssetImage("asset/OIP.jpg"),
//                              radius: 80,
//                               ),
//                                Text("This Graduate finished his academic class. Every company or institution can trust this system to Identify the candidates for some position", style: TextStyle(color: Colors.indigo, fontSize: 18),),
//                         ]
//                     ,
//                     )
//                     ),
//                     Card(
//                       child: ElevatedButton(
//                       child: Text('Open route'),
//                       onPressed: () {
//                         Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => MyApp()),
//                     );
//                     },
//                     ),
//                     )
//                      // Card(
//                     //   child: Column(
//                     //     children: [
//                     //       Text("This Graduate finished his academic class. Every company or institution can trust this system to Identify the candidates for some position")
//                     //     ],
//                     //   ),
//                     // ),
                    
//                   ],
//                 ),
//               );
//             })));
//   }
// }

