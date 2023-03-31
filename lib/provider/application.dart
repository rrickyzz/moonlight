import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'dart:developer' as dev;

import 'package:path_provider/path_provider.dart';

class ApplicationProvider extends ChangeNotifier {
  final player = AudioPlayer();
  final songDuration = useState<Duration?>(Duration.zero);
  final min = useState<double>(0);
  bool connectionStatus = false;
  final max = useState<Duration>(Duration.zero);
  final OnAudioQuery audioQuery = OnAudioQuery();
  List<SongModel> songs = [];
  initSongs() async {
    if (songs.isNotEmpty) {
      return;
    }
    songs = await audioQuery.querySongs();
  }

  notify() async {
    notifyListeners();
  }

  initPlayer() async {
    if (songs.isNotEmpty) {
      player.setFilePath(songs[0].uri ?? '');
      return;
    }
    notifyListeners();
  }

  play() async {
    if (!player.playing) {
      await player.play();
      notifyListeners();
    }
  }
}
