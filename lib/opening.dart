import 'package:flutter/material.dart';

import 'main.dart';

class OpenApp extends StatefulWidget {
  @override
  _OpenAppState createState() => _OpenAppState();
}

class _OpenAppState extends State<OpenApp> {
  @override

  void initState() { 
    Future.delayed(Duration(seconds:2),(){
      // AssetImage("asset/OIP2.jpg");
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>MyHomePage(title: "ETHIOPIA HEDVS")));
    });
    super.initState();
    
  }
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.orangeAccent,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomRight,
                colors:[
                  Colors.white,
                   Colors.yellowAccent,
                   
                ]
              )
            ),
        child: Column(
        children: [
          Padding(padding: EdgeInsets.all(50)),
          CircleAvatar(
            backgroundImage: AssetImage("asset/coming.jpg"), radius: 100,
          ),
          Padding(padding: EdgeInsets.all(30)),
          Text("ETHIOPIA HEDVS", style: TextStyle(fontSize: 30),),
          Padding(padding: EdgeInsets.all(30)),
          CircleAvatar(
            backgroundImage: AssetImage("asset/th.jpg"), radius: 50,
          ),
          // Container(
           
          //   child: CircleAvatar(backgroundImage: AssetImage("asset/coming.jpg"), radius: 100,),
          // ),
        ],
      ),
    )
    );
    
  }
}