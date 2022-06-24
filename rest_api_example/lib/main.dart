import 'package:flutter/material.dart';
import 'package:rest_api_example/getApi/signUpScreen.dart';
import 'package:rest_api_example/getApi/uploadImage.dart';
import 'getApi/ScreenOne.dart';

void main(){
runApp(MyApp());
}

class  MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData.light(),
      home: ExampleOne(),
      // home: signUpScreen()
      // home: UploadImageScreen(),
    );
  }
}