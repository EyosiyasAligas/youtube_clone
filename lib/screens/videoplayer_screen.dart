import 'package:flutter/material.dart';
import 'package:youtube_api/youtube_api.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

import '../widgets/video_details.dart';

class VideoPlayer extends StatefulWidget {
  const VideoPlayer({
    Key? key,
    required this.video,
    required this.url,
  }) : super(key: key);

  final YouTubeVideo video;
  final String url;

  @override
  State<VideoPlayer> createState() => _VideoPlayerState();
}

class _VideoPlayerState extends State<VideoPlayer> {
  late YoutubePlayerController _controller;

  void runYoutubePlayer() {
    _controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(widget.url).toString(),
      flags: const YoutubePlayerFlags(
        enableCaption: false,
        isLive: false,
        forceHD: true,
      ),
    );
  }

  @override
  void initState() {
    runYoutubePlayer();
    super.initState();
  }

  @override
  void deactivate() {
    _controller.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return YoutubePlayerBuilder(
      player: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
        progressColors: const ProgressBarColors(
          backgroundColor: Colors.white30,
          handleColor: Colors.red,
          playedColor: Colors.red,
        ),
      ),
      builder: (context, player) {
        return Scaffold(
          backgroundColor: Colors.grey[900],
          body: Container(
            width: size.width,
            color: Colors.black45,
            child: Column(
              children: [
                Container(
                  child: Stack(
                    children: [
                      Container(
                        child: player,
                      ),
                      Positioned(
                        left: 5,
                        top: 5,
                        child: IconButton(
                          onPressed: () => Navigator.of(context).pop(),
                          icon: const Icon(
                            Icons.arrow_back,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                VideoDetails(
                  video: widget.video,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
