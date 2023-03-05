import 'dart:convert';
import 'package:boomlingo/signaling.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:boomlingo/util/widgets/to_previous_page.dart';

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
      setState(() {
        _remoteRenderer.srcObject = stream;
      });

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
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(global_style.pageBackgroundColor),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Expanded(
                  child: ToPrevPage()
                ),
                Expanded(
                  child: Row(
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: RTCVideoView(_localRenderer, mirror: true),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.75,
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: RTCVideoView(_remoteRenderer)
                      )
                    ],
                  ),
                ),
          Expanded(
            child: Row(children: [
            InkWell(
                onTap: () {
                  setState(() {
                    signaler.openUserMedia(_localRenderer, _remoteRenderer);
                  });

                  setState(() {
                    signaler.createRoom(_remoteRenderer, userName:textEditingController.text);
                  });
                },
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(global_style.lightBlueAccentColor),
                    ),
                    margin: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                        height: 60,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(SimpleLineIcons.call_out),
                              Text('Call')
                            ])))),
            const Spacer(),
            InkWell(
                onTap: () {
                  setState(() {
                    signaler.joinRoom(
                          userName:textEditingController.text,
                        );
                  });

                  setState(() {
                    signaler.createAnswer(
                      _remoteRenderer,
                        userName:textEditingController.text,
                    );
                    if (_remoteRenderer.srcObject != null) {
                      print("_remoteRenderer updated");
                      print("Added tracks: ");
                      print(_remoteRenderer.srcObject!.getTracks());
                    }
                  });
                },
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Color(global_style.lightBlueAccentColor),
                    ),
                    child: SizedBox(
                        height: 60,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(SimpleLineIcons.call_in),
                              Text('Join')
                            ])))),
            const Spacer(),
            InkWell(
                onTap: () {
                  signaler.hangUp(_localRenderer, userName:textEditingController.text);
                },
                child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: Colors.red,
                    ),
                    margin: const EdgeInsets.only(right: 10),
                    child: SizedBox(
                        height: 60,
                        width: 100,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Icon(SimpleLineIcons.call_end),
                              Text('Hang Up')
                            ]))))
            ]),
          )
    ])));
  }
}
