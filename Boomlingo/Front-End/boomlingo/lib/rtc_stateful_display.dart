import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class RTCVideoDisplay extends StatefulWidget {
  const RTCVideoDisplay({Key? key}) : super(key: key);

  @override
  State<RTCVideoDisplay> createState() => _RTCVideoDisplayState();
}

const title = "RTC_VIDEO_WINDOW";

final _localVideoRenderer = RTCVideoRenderer();

void initRenderers() async {
  await _localVideoRenderer.initialize();
}

_getUserMedia() async {
  final Map<String, dynamic> mediaConstraints = {
    'audio': true,
    'video': {
      'facingMode': 'user',
    }
  };

  MediaStream stream =
      await navigator.mediaDevices.getUserMedia(mediaConstraints);
  _localVideoRenderer.srcObject = stream;
}

class _RTCVideoDisplayState extends State<RTCVideoDisplay> {
  @override
  void initState() {
    initRenderers();
    _getUserMedia();
    super.initState();
  }

  @override
  void dispose() async {
    await _localVideoRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(title),
      ),
      body: Stack(
        children: [
          Positioned(
              top: 0.0,
              right: 0.0,
              left: 0.0,
              bottom: 0.0,
              child: RTCVideoView(_localVideoRenderer))
        ],
      ),
    );
  }
}
