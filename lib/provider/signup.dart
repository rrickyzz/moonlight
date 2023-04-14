import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:developer' as dev;

import 'package:path_provider/path_provider.dart';

class SignupProvider extends ChangeNotifier {
  // Create storage
  bool loading = false;

  setLoading(bool value) {
    loading = value;
    notifyListeners();
  }
}
