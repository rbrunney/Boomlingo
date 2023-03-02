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
    print("initial tracks");
    if (_remoteRenderer.srcObject != null) {
      print(_remoteRenderer.srcObject!.getTracks());
    }
    signaler.onAddRemoteStream = ((stream) {
      print("changing remote renderer source");
      stream.getTracks().forEach((track) {
        if (track.muted!) {
          track.enabled = true;
        }
      });
      setState(() {});
      _remoteRenderer.srcObject = stream;
      setState(() {});
      print("updated tracks");
      print(_remoteRenderer.srcObject!.getTracks());
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
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 15,
                width: 8,
              ),
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
                  // Add roomId
                  signaler.createAnswer(
                    _remoteRenderer,
                    // textEditingController.text,
                  );
                },
                child: Text("Create answer and connect"),
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
