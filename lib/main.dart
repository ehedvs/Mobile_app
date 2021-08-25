import 'package:check_mobile_app/api_control.dart';
// import 'package:check_mobile_app/opening.dart';
import 'package:flutter/material.dart';
//.....................................................Needed packages
void main() {
  runApp(MyApp());
}
//''''''''''''''''''''''''''''''''''''''''''''''''''''''main statement
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: "ETHIOPIA HEDVS"),
//......................................................home app comes after launch page comes first
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
      // backgroundColor: Colors.orangeAccent,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
        // child: ElevatedButton(
        //               child: Text('Open route'),
        //               onPressed: () {
        //                 Navigator.push(
        //               context,
        //               MaterialPageRoute(builder: (context) => MyApp()),
        leading: new IconButton(
        icon: new Icon(Icons.arrow_back, color: Colors.orange),
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MyApp()),
        ), 
      )
      ),
      body: FutureBuilder(
        future: fetchGraduates(),
        builder: (context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) 
          return PhotosList(photos: snapshot.data!);
          // print(snapshot.data);
          return Container(
            
              child: Column(
                children: [
                  Center(
                    child: Column(
                      children: [
                 
                  Text("", style: TextStyle(fontSize: 30),),
                  CircleAvatar(
                  backgroundImage: AssetImage("asset/OIP2.jpg"), 
                  radius: 50,
                ),
                Padding(padding: EdgeInsets.all(30)),
                Text("Not Genuine Document!", style: TextStyle(fontSize: 25,color: Colors.greenAccent),),
                Padding(padding: EdgeInsets.all(10)),
                 CircleAvatar(
                  backgroundImage: AssetImage("asset/OIP.jpg"), 
                  radius: 50,
                ),
                // Padding(padding: EdgeInsets.all(30)),
                
                Text("There might be these error:-", style: TextStyle(fontSize: 20, color: Colors.blueAccent),),
                Text(" Not true document", style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                
                Text(" Not Wrong document", style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                Text(" Not Legal document", style: TextStyle(fontSize: 20,color: Colors.blueAccent),),
                
          // Container(
           
          //   child: CircleAvatar(backgroundImage: AssetImage("asset/coming.jpg"), radius: 100,),
          // ),
        ],),
                  ),
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
        body: Card(
          child:ListView.builder(
            itemCount: photos.length,
            itemBuilder: (context, index) {

              // print(photos[index].thumbnailUrl);
              // print(photos[index].thumbnailUrl);
              return Container(
                
                child: Column(
                  children: [
                    Center(
                      child: Column(
                        children: [
                          CircleAvatar
                          (
                              backgroundImage: NetworkImage('${photos[index].thumbnailUrl}',scale: 90),
                              radius: 90,  
                              
                          ),
                        ],
                      ),
                    ),
                    
                    Center(
                      child: Text(
                        photos[index].fullname, textAlign : TextAlign.center,style: TextStyle( fontSize: 20, fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                    ),
                    Center(
                      child: Column(
                        children: [
                          Text( photos[index].institution, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 17)),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                                 ),
                          Text(photos[index].school,style: TextStyle(color: Colors.lightGreen, fontWeight: FontWeight.bold, fontSize: 15)),
                        ],
                      ),
                      
                    ),
                    
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                    ),
                    Text(photos[index].dept, style: TextStyle(color: Colors.lightBlue, fontWeight: FontWeight.bold, fontSize: 15)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Text("GPA:---"+photos[index].gpa, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15),),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                          
                    Text("CGPA:---"+photos[index].cgpa, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    Text("Graduation Date:---"+photos[index].date, style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold, fontSize: 15)),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                    ),
                    
                    
                    SizedBox(
                      width : 300, 
                      height : 700, 
                      child : Column(
                        children: [
                          CircleAvatar(
                             backgroundImage: AssetImage("asset/OIP.jpg"),
                             radius: 50,
                              ),
                               Text("This Graduate finished his academic class. Every company or institution can trust this system to Identify the candidates for some position", style: TextStyle(color: Colors.indigo, fontSize: 18),),
                        ]
                    )
                    ),
                    
                  ],
                ),
              );
            }
            )
            )
            );
  }
}