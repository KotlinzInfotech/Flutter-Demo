import 'package:flutter/material.dart';
import 'package:native_banner_inline/admob_services.dart';
import 'package:native_banner_inline/native_banner_inline.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  AdmobServices.initialize();
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
      home: const NativeBannerInline(),
    );
  }
}
