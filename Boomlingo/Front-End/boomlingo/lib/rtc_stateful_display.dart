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
  TextEditingController textEditingController = TextEditingController();
  Signaling signaler = Signaling();
  @override
  void initState() {
    _localRenderer.initialize();
    _remoteRenderer.initialize();
    // signaler.createRoom(_remoteRenderer);
    signaler.initChannel();
    signaler.onAddRemoteStream = ((stream) {
      _remoteRenderer.srcObject = stream;
      setState(() {});
    });
    // signaler.initRTC(_remoteRenderer);
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
      // appBar: AppBar(
      //   // ignore: prefer_const_constructors
      //   title: Text("bruh"),
      // ),
      // body: Column(),
      body: Column(
        children: [
          SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  signaler.openUserMedia(_localRenderer, _remoteRenderer);
                },
                child: Text("Open camera & microphone"),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () async {
                  // signaler.initChannel();
                  signaler.createRoom(_remoteRenderer);
                },
                child: Text("Create room"),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  // Add roomId
                  signaler.joinRoom(
                    _remoteRenderer,
                    // textEditingController.text,
                  );
                },
                child: Text("Join room"),
              ),
              SizedBox(
                width: 8,
              ),
              ElevatedButton(
                onPressed: () {
                  signaler.hangUp(_localRenderer);
                },
                child: Text("Hangup"),
              )
            ],
          ),
          SizedBox(height: 8),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(child: RTCVideoView(_localRenderer, mirror: true)),
                  Expanded(child: RTCVideoView(_remoteRenderer)),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Join the following Room: "),
                Flexible(
                  child: TextFormField(
                    controller: textEditingController,
                  ),
                )
              ],
            ),
          ),
          SizedBox(height: 8)
        ],
      ),
    );
  }
}
