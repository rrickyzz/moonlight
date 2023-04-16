import 'dart:async';
import 'package:better_player/better_player.dart';
import 'package:chewie/chewie.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:moonlight/provider/application.dart';
import 'package:moonlight/styles/design_system.dart';
import 'package:provider/provider.dart';
import 'dart:developer' as dev;

import 'package:video_player/video_player.dart';

class HomePage extends HookWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    final provider = Provider.of<ApplicationProvider>(context);
    final isFullScreen = useState(false);

    FlickManager flickManager = FlickManager(
      autoInitialize: true,
      autoPlay: false,
      videoPlayerController: VideoPlayerController.network(
          "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4"),
    );
    flickManager.flickControlManager?.addListener(
      () => {
        if (flickManager.flickControlManager!.isFullscreen)
          {
            isFullScreen.value = flickManager.flickControlManager!.isFullscreen,
          }
      },
    );

    useEffect(() {
      //videoPlayerController.initialize();
      // This will be called when the widget is first created

      return () {
        dev.log('disposed');
      };
    }, const []);

    return WillPopScope(
      onWillPop: () async {
        //  flickManager.flickControlManager?.exitFullscreen();

        return false;
      },
      child: Scaffold(
          resizeToAvoidBottomInset: true,
          body: Stack(
            children: <Widget>[
              Container(
                color: Colors.red,
                child: null,
              ),
              SafeArea(
                child: SizedBox(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    AspectRatio(
                        aspectRatio: 16 / 9,
                        child: FlickVideoPlayer(
                          flickVideoWithControls: const FlickVideoWithControls(
                              controls: FlickLandscapeControls()),
                          flickManager: flickManager,
                        )),
                    ElevatedButton(
                        onPressed: () {
                          context.push('/dashboard');
                          flickManager.dispose();
                        },
                        child: const Text(
                          'Proceed to Dashboard',
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )),
              ),
            ],
          )),
    );
  }
}
