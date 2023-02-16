import 'dart:convert';

import 'package:boomlingo/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';

class RTCVideoDisplay extends StatefulWidget {
  const RTCVideoDisplay({Key? key}) : super(key: key);

  @override
  State<RTCVideoDisplay> createState() => _RTCVideoDisplayState();
}

class _RTCVideoDisplayState extends State<RTCVideoDisplay> {
  RTCVideoRenderer _localRenderer = RTCVideoRenderer();
  RTCVideoRenderer _remoteRenderer = RTCVideoRenderer();
  String? roomID;
  TextEditingController textEditingController = TextEditingController();
  Signaling signaler = Signaling();
  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    // signaler.createRoom(_remoteRenderer);
    signaler.initChannel();
    super.initState();
  }

  @override
  void dispose() async {
    _localRenderer.dispose();
    _remoteRenderer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text("bruh"),
      ),
      body: Column(),
    );
  }
}
