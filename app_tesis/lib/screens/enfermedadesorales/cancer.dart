import 'dart:ffi';

import 'package:app_tesis/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'package:video_player/video_player.dart';

class Cancer extends StatefulWidget {

  @override
  _CancerState createState() => _CancerState();
}

class _CancerState extends State<Cancer> {
  final assets = 'videos/AT-cm_1102546002.mp4';
  VideoPlayerController controller;

  @override
  void initState(){
    super.initState();
    controller = VideoPlayerController.asset(assets)
    ..addListener(() => setState(() {}))
    ..setLooping(true)
    ..initialize().then((_) => controller.play());
  }

  @override 
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override 
  Widget build(BuildContext context){
    return VideoPlayer(controller: controller);
  }
}