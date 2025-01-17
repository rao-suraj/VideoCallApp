import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';


@RoutePage()
class VideoCallScreen extends StatefulWidget {
  const VideoCallScreen({super.key});

  @override
  State<VideoCallScreen> createState() => _VideoCallScreenState();
}

class _VideoCallScreenState extends State<VideoCallScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('Video Call Screen'),
      ),
    );
  }
}