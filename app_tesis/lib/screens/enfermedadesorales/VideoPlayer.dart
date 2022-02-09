import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayer extends StatelessWidget {
  final VideoPlayerController controller;

  const VideoPlayer( Key key, @required this.controller, ) : super(key: key);

  @override
  Widget build(BuildContext context)  =>
    controller != null && controller.value.isInitialized
      ? container(alignment: Alignment.topCenter, child: buildVideo())

}