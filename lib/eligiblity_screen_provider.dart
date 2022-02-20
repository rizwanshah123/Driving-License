import 'package:flutter/material.dart';

class EligiblityScreenProvider with ChangeNotifier {
  String _eligiblityMessage = "";
  bool _isEligible=false;

  void checkEligiblity(int age) {
    if (age >= 18) {
      eligibleForLicense();
    } else {
      notEligibleForLicense();
    }
  }

  void eligibleForLicense() {
    _eligiblityMessage = "you are Eligible For License";
    _isEligible = true;
    notifyListeners();
  }

  void notEligibleForLicense() {
    _eligiblityMessage = "you Are not Eligible For license";
    _isEligible = false;
    notifyListeners();
  }


  String get eligibilityMessage {
    return _eligiblityMessage;
  }


  bool get isEligible {
    return _isEligible;
  }
}
