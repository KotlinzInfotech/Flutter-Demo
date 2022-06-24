import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:inline_banner/AdmobHelper.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobHelper.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Inline Banner',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late List<String> datas;   // late for null safty
  late List<Object> dataads;

  @override
  void initState() {
    super.initState();
    datas = [];
    for(int i = 1; i <= 20; i++){
      datas.add("List Item $i");
    }
    dataads = List.from(datas);
    for(int i =0 ; i<=2; i ++){
      var min = 1;
      var rm = new Random();

      var rannumpos = min + rm.nextInt(18);

      dataads.insert(rannumpos, AdmobHelper.getBannerAd()..load());
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: dataads.length,
          itemBuilder: (context,index){
            if(dataads[index] is String)
            {
              return ListTile(
                title: Text(dataads[index].toString()),
                leading: Icon(Icons.exit_to_app),
                trailing: Icon(Icons.ice_skating),
              );
            }else{
              final Container adcontent = Container(
                child: AdWidget(
                  ad: dataads[index] as BannerAd,
                  key: UniqueKey(),
                ),
                height: 50,
              );
              return adcontent;
            }
          }),
      bottomNavigationBar: Container(
        child: AdWidget(
          ad:AdmobHelper.getBannerAd()..load(),
          key: UniqueKey(),
        ),
        height: 50,
      ),
    );
  }
}

