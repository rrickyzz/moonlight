import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_audio/just_audio.dart';
import 'dart:developer' as dev;

class ApplicationProvider extends ChangeNotifier {
  final player = AudioPlayer();
  final title = useState("Cold");
  final artist = useState("Neffex");
  final songDuration = useState<Duration?>(Duration.zero);
  final min = useState<double>(0);
  final max = useState<Duration>(Duration.zero);
  initUrl({required String url}) async {
    Duration? duration;
    try {
      // Create a player
      duration =
          await player.setAudioSource(AudioSource.asset('lib/assets/c.mp3'));

      max.value = duration ?? Duration.zero;
      songDuration.value = duration;
      player.icyMetadataStream.listen((event) {
        dev.inspect(event);
      });
    } catch (e) {
      debugPrint('Error $e');
    }

    return duration;
  }

  notify() async {
    notifyListeners();
  }

  play() async {
    await player.play();
    notifyListeners();
  }
}
