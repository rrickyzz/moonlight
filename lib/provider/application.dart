import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:developer' as dev;

import 'package:path_provider/path_provider.dart';

class ApplicationProvider extends ChangeNotifier {
  // Create storage
  final storage = FlutterSecureStorage();
  bool checkIfNewUser = true;
  int signupSliderIndex = 0;
  isNewUser() async {
    var result = await storage.read(key: 'isNewUser');
    checkIfNewUser = result != null ? false : true;
    notifyListeners();
  }

  setSignupSliderIndex() {
    if (signupSliderIndex < 3) {
      signupSliderIndex++;
    }
    notifyListeners();
  }

  resetSignupSliderIndex() {
    signupSliderIndex = 0;
    notifyListeners();
  }
}
