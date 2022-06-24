import 'dart:io';
import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

  List<CameraDescription>? cameras;
  CameraController? controller;
  XFile? image;

  @override
  void initState() {
    loadCamera();
    super.initState();
  }

  loadCamera() async {
    cameras = await availableCameras();
    if(cameras != null){
      controller = CameraController(cameras![0], ResolutionPreset.max);

      controller!.initialize().then((_) {
        if (!mounted) {
          return;
        }
        setState(() {});
      });
    }else{
      print("No any camera found");
    }
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: const Text("Camera Demo"),
        backgroundColor: Colors.redAccent,
      ),
      body: Column(
          children:[
            SizedBox(
                height:300,
                width:400,
                child: controller == null?
                const Center(child:Text("Loading Camera...")):
                !controller!.value.isInitialized?
                const Center(
                  child: CircularProgressIndicator(),
                ):
                CameraPreview(controller!)
            ),

            ElevatedButton.icon(
              onPressed: () async {
                try {
                  if(controller != null){
                    if(controller!.value.isInitialized){
                      image = await controller!.takePicture();
                      setState(() {
                        //update UI
                      });
                    }
                  }
                } catch (e) {
                  print(e);
                }
              },
              icon: const Icon(Icons.camera),
              label: const Text("Pick Image From Camera"),
            ),

            Container(
              padding: const EdgeInsets.all(30),
              child: image == null?
              const Text("No image captured"):
              Image.file(File(image!.path), height: 300,),

            )
          ]
      ),

    );
  }
}
