import 'package:flutter/material.dart';

import 'face_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Face Authentication'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Center(
              child: Column(
                children: [
                  Text('Home',style: TextStyle(fontSize: 35),
                  ),
                  SizedBox(height: 48),
                  buildLogoutButton(context)
                ],
              ),
        ),
      ),
    );
  }
}

Widget buildLogoutButton(BuildContext context) => ElevatedButton(
  style: ElevatedButton.styleFrom(
    minimumSize: Size.fromHeight(50),
  ),
  child: Text(
    'Logout',
    style: TextStyle(fontSize: 20),
  ),
  onPressed: () => Navigator.of(context).pushReplacement(
    MaterialPageRoute(builder: (context) => FacePage()),
  ),
);
