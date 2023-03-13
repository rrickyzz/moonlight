import 'package:flutter/cupertino.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:just_audio/just_audio.dart';
import 'package:spotify_sdk/models/connection_status.dart';
import 'dart:developer' as dev;

import 'package:spotify_sdk/spotify_sdk.dart';

class ApplicationProvider extends ChangeNotifier {
  final player = AudioPlayer();
  final title = useState("Cold");
  final artist = useState("Neffex");
  final songDuration = useState<Duration?>(Duration.zero);
  final min = useState<double>(0);
  bool connectionStatus = false;
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

  initConnection() async {
    // var connectionParams = ConnectionParams.Builder(clientId)
    // .setRedirectUri(redirectUri)
    // .showAuthView(true)
    // .build()

    await dotenv.load(fileName: ".env");
    var clientId = dotenv.get("CLIENT_ID");
    connectionStatus = await SpotifySdk.connectToSpotifyRemote(
        clientId: clientId,
        redirectUrl: "https://pub.dev/packages/spotify_sdk");
    notifyListeners();
  }

  notify() async {
    notifyListeners();
  }

  play() async {
    await player.play();
    notifyListeners();
  }
}
