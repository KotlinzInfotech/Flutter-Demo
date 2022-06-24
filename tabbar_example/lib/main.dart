import 'package:flutter/material.dart';


void main(){
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: DefaultTabController(
       length: 2,
       child: Scaffold(
         appBar: AppBar(
           title: Text("Tab Bar"),
           bottom: TabBar(
             tabs: [
               Tab(icon: Icon(Icons.contacts), text: "Tab 1"),
               Tab(icon: Icon(Icons.camera),text: 'Tab 2',)
             ],
           ),
         ),
         body: TabBarView(
           children: [
             FirstScreen(),
             SecondSecreen()
           ],
         ),
       ),
     ),
   );
  }

}
class FirstScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('First Tab',style: TextStyle(fontSize: 15.0),),
      ),
    );
  }
}

class SecondSecreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Second Tab',style: TextStyle(fontSize: 15.0),),
      ),
    );
  }
}
