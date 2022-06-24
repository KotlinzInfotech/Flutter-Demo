import 'package:flutter/material.dart';

class EligiblityScreenProvider extends ChangeNotifier {
  String _eligiblityMessage = "";
  bool _isEligible = false;

  void checkEligiblity(int age) {
    if (age >= 18) {
      _eligiblityMessage = "You are eligible to apply for Driving License";
      _isEligible = true;
      notifyListeners();
    } else {
      _eligiblityMessage = "You are not eligible to apply for Driving License";
      _isEligible = false;
      notifyListeners();
    }
  }

  String get eligiblityMessage => _eligiblityMessage;

  bool get isEligible => _isEligible;
}
