import 'package:bubbly/view/video/multi_manager.dart';
import 'package:bubbly/view/video/portrait_control.dart';
import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:visibility_detector/visibility_detector.dart';
import 'package:video_player/video_player.dart';

class FlickMultiPlayer extends StatefulWidget {
  const FlickMultiPlayer({
    Key key,
    this.url,
    this.image,
    this.flickMultiManager,
  }) : super(key: key);

  final String url;
  final String image;
  final FlickMultiManager flickMultiManager;

  @override
  _FlickMultiPlayerState createState() => _FlickMultiPlayerState();
}

class _FlickMultiPlayerState extends State<FlickMultiPlayer> {
  FlickManager flickManager;
  VideoPlayerController _controller;

  @override
  void initState() {
    _controller = VideoPlayerController.network(widget.url);
    // _controller = VideoPlayerController.network(
    //   Const.itemBaseUrl + widget.url,
    // );
    _controller.addListener(() {
      setState(() {});
    });
    _controller.setLooping(true);
    _controller.initialize().then((_) => {setState(() {})});

    flickManager = FlickManager(
      videoPlayerController: VideoPlayerController.network(widget.url)
        ..setLooping(true),
      autoPlay: false,
    );
    widget.flickMultiManager.init(flickManager);

    super.initState();
  }

  @override
  void dispose() {
    widget.flickMultiManager.remove(flickManager);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: ObjectKey(flickManager),
      onVisibilityChanged: (visiblityInfo) {
        if (visiblityInfo.visibleFraction > 0.9) {
          widget.flickMultiManager.play(flickManager);
        }
      },
      child: Container(
        child: Center(
          child: SizedBox(
            width: _controller.value.size?.width ?? 0,
            height: _controller.value.size?.height ?? 0,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Center(
                  child: FlickVideoPlayer(
                    flickManager: flickManager,
                    flickVideoWithControls: FlickVideoWithControls(
                      videoFit: _controller.value != null &&
                              _controller.value.size != null &&
                              _controller.value.size.width != null &&
                              _controller.value.size.height != null &&
                              (_controller.value.size.width >=
                                      (_controller.value.size.height) ||
                                  _controller.value.size?.height ==
                                      _controller.value.size.width)
                          ? BoxFit.fitWidth
                          : BoxFit.cover,
                      playerLoadingFallback: Positioned.fill(
                        child: Stack(
                          children: <Widget>[
                            Positioned.fill(
                              child: Image.asset(
                                widget.image,
                                fit: BoxFit.cover,
                              ),
                            ),
                            Positioned(
                              right: 10,
                              top: 10,
                              child: Container(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  backgroundColor: Colors.white,
                                  strokeWidth: 4,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      controls: FeedPlayerPortraitControls(
                        flickMultiManager: widget.flickMultiManager,
                        flickManager: flickManager,
                      ),
                    ),
                    flickVideoWithControlsFullscreen: FlickVideoWithControls(
                      playerLoadingFallback: Center(
                          child: Image.network(
                        widget.image,
                        fit: BoxFit.fitWidth,
                      )),
                      controls: FlickLandscapeControls(),
                      iconThemeData: IconThemeData(
                        size: 40,
                        color: Colors.white,
                      ),
                      textStyle: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
