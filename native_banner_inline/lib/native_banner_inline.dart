import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class NativeBannerInline extends StatefulWidget {
  const NativeBannerInline({Key? key}) : super(key: key);

  @override
  State<NativeBannerInline> createState() => _NativeBannerInlineState();
}

class _NativeBannerInlineState extends State<NativeBannerInline> {
  static final AdIndex = 4;
  late NativeAd _ad;
  bool _isAdLoaded = false;
  List<Object> itemList = [];

  int _getListIndexItem(int listIndex) {
    if (listIndex >= AdIndex && _isAdLoaded) {
      return listIndex - 1;
    }
    return listIndex;
  }

  @override
  void initState() {
    _ad = NativeAd(
        adUnitId: NativeAd.testAdUnitId,
        factoryId: "listTile",
        listener: NativeAdListener(onAdLoaded: (_) {
          setState(() {
            _isAdLoaded = true;
          });
        }, onAdFailedToLoad: (ad, adError) {
          ad.dispose();
          print('Ad Load Failed${adError.code}Message${adError.message}');
        }),
        request: const AdRequest());
    _ad.load();
    for (int i = 1; i <= 20; i++) {
      itemList.add("Row$i");
    }
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Native Banner Inline'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          if (_isAdLoaded && index == AdIndex) {
            return Container(
              child: AdWidget(
                ad: _ad,
              ),
              height: 100.0,
              alignment: Alignment.center,
            );
          } else {
            final item = itemList[_getListIndexItem(index)] as String;
            return  ListTile(
              leading: Icon(Icons.home),
              title: Text(
                item,
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('Test Description'),
            );
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _ad.dispose();
  }
}
