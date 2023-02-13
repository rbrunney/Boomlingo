import 'dart:convert';

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
final _remoteVideoRenderer = RTCVideoRenderer();

final sdpController = TextEditingController();
bool _offer = false;

RTCPeerConnection? _peerConnection;

void initRenderers() async {
  await _localVideoRenderer.initialize();
  await _createPeerConnection().then((value) {
    print(value);
    print(
        "_printConnection is being set to value returned by _createPeerConnection()");
    _peerConnection = value;
  });
}

Future<RTCPeerConnection> _createPeerConnection() async {
  Map<String, dynamic> configuration = {
    "iceServers": [
      {"url": "stun:stun.l.google.com:19302"},
    ]
  };

  final Map<String, dynamic> offerSdpConstraints = {
    "mandatory": {
      "OfferToReceiveAudio": true,
      "OfferToReceiveVideo": true,
    },
    "optional": [],
  };

  late MediaStream localStream;

  localStream = await _getUserMedia();

  RTCPeerConnection peerConnection =
      await createPeerConnection(configuration, offerSdpConstraints);

  peerConnection.addStream(localStream);

  peerConnection.onIceCandidate = (e) {
    if (e.candidate != null) {
      print(json.encode({
        'candidate': e.candidate,
        'sdpMid': e.sdpMid,
        'sdpMlineIndex': e.sdpMLineIndex
      }));
    }
  };

  peerConnection.onIceConnectionState = (e) {
    print(e);
  };

  peerConnection.onAddStream = (stream) {
    print("addStream: " + stream.id);
    _remoteVideoRenderer.srcObject = stream;
  };

  print("resulting peer connection object");
  print(peerConnection);

  return peerConnection;
}

void _createOffer() async {
  RTCSessionDescription description =
      await _peerConnection!.createOffer({'offerToReceiveVideo': 1});
  var session = description.sdp.toString();
  print(session);
  print(json.encode(session));
  _offer = true;

  _peerConnection!.setLocalDescription(description);
}

void _createAnswer() async {
  RTCSessionDescription description =
      await _peerConnection!.createAnswer({'offerToReceiveVideo': 1});

  var session = description.sdp.toString();
  print(session);
  // print(json.decode(session));
  print(description.toMap());
  print(description.sdp);

  _peerConnection!.setLocalDescription(description);
}

void _setRemoteDescription() async {
  String jsonString = sdpController.text;
  dynamic session = jsonString;

  String sdp = json.encode(session);

  RTCSessionDescription description =
      // RTCSessionDescription("$sdp\n", _offer ? 'answer' : 'offer');
      RTCSessionDescription("$jsonString\n", _offer ? 'answer' : 'offer');
  print(description.toMap());

  await _peerConnection!.setRemoteDescription(description);
}

void _addCandidate() async {
  String jsonString = sdpController.text;
  dynamic session = await jsonDecode(jsonString);
  // print(session['candidate']);
  dynamic candidate = RTCIceCandidate(
      session['candidate'], session['sdpMid'], session['sdpMlineIndex']);
  

  await _peerConnection!.addCandidate(candidate);
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
  return stream;
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
    sdpController.dispose();
    super.dispose();
  }

  SizedBox videoRenderers() => SizedBox(
        height: 210,
        child: Row(
          children: [
            Flexible(
                child: Container(
              key: Key('local'),
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: BoxDecoration(color: Colors.black),
              child: RTCVideoView(_localVideoRenderer),
            )),
            Flexible(
                child: Container(
              key: Key("remote"),
              margin: EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
              decoration: BoxDecoration(color: Colors.black),
              child: RTCVideoView(_remoteVideoRenderer),
            ))
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // ignore: prefer_const_constructors
        title: Text(title),
      ),
      body: Column(
        children: [
          videoRenderers(),
          Row(children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: TextField(
                  controller: sdpController,
                  keyboardType: TextInputType.multiline,
                  maxLines: 4,
                  maxLength: TextField.noMaxLength,
                ),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                ElevatedButton(
                  onPressed: _createOffer,
                  child: Text("Offer"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _createAnswer,
                  child: Text("Answer"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _setRemoteDescription,
                  child: Text("Set Remote Description"),
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: _addCandidate,
                  child: Text("Set Candidate"),
                ),
              ],
            )
          ]),
        ],
      ),
    );
  }
}
