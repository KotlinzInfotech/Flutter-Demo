import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdmobServices {

  static initialize() {
    if(MobileAds.instance == null){
      MobileAds.instance.initialize();
    }
  }
}
