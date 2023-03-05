import 'dart:convert';
import 'dart:io';
import 'package:boomlingo/util/style/global_style.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:boomlingo/util/global_data/global_data.dart' as global_data;

typedef void StreamStateCallback(MediaStream stream);

class Signaling {
  Map<String, dynamic> config = {
    'iceServers': [
      {
        'urls': [
          'stun:stun1.1.google.com:19302',
          'stun:stun2.1.google.com:19302'
        ]
      }
    ]
  };

  late RTCPeerConnection peerConnection;
  MediaStream? localStream;
  MediaStream? remoteStream;
  String? roomID;
  String? currentRoomText;
  StreamStateCallback? onAddRemoteStream;
  RTCSessionDescription? offerSdpDescription;

  // final signalingUri = Uri.parse("https://boomlingowebrtc.azurewebsites.net/socket/");

  final signalingChannel = WebSocketChannel.connect(
    //Uri.parse("ws://boomlingowebrtc.azurewebsites.net/socket/")
    // signalingUri
    Uri(scheme: "ws", host: global_data.awsWebRTCServerIP, port: 80, path: "/socket"),
  );

  initChannel() async {
    await signalingChannel.ready.then((value) {
      print("Channel ready");
    });

    peerConnection = await createPeerConnection(config);

    registerPeerConnectionListeners();

    // signalingChannel.sink.add("random nonsense");
    signalingChannel.stream.listen((event) async {
      print(event);
      // print("signaling channel got a message back!");
      Map<String, dynamic> eventJson = await jsonDecode(event);
      if (eventJson.containsKey("offer")) {
        var offerJson = eventJson["offer"];
        offerSdpDescription =
            RTCSessionDescription(offerJson["sdp"], offerJson["type"]);
        await peerConnection.setRemoteDescription(offerSdpDescription!);
      } else if (eventJson.containsKey("answer")) {
        if (peerConnection.getRemoteDescription() != null) {
          var answer = RTCSessionDescription(
            eventJson['answer']['sdp'],
            eventJson['answer']['type'],
          );

          print("Answer received!");
          await peerConnection.setRemoteDescription(answer);
        }
      } else if (eventJson.containsKey("ice_candidate")) {
        print('Got new remote ICE candidate: ${eventJson}');
        peerConnection.addCandidate(
          RTCIceCandidate(
            eventJson['ice_candidate']['candidate'],
            eventJson['ice_candidate']['sdpMid'],
            eventJson['ice_candidate']['sdpMLineIndex'],
          ),
        );
      }
    });
  }

  createRoom(RTCVideoRenderer remoteRenderer, {String userName = ""}) async {
    print("Create peer connection with config $config");
    localStream?.getTracks().forEach((track) {
      peerConnection.addTrack(track, localStream!);
    });

    peerConnection.onTrack = (RTCTrackEvent trackEvent) {
      print("Got remote track ${trackEvent.streams[0]}");

      trackEvent.streams[0].getTracks().forEach((track) {
        print("Adding tracks to remote stream $track");
        remoteStream?.addTrack(track);
      });
      remoteRenderer.srcObject = remoteStream;
    };

    peerConnection.onIceCandidate = (RTCIceCandidate candidate) {
      print('Got candidate: ${candidate.toMap()}');
      Map<String, dynamic> candidateMap = {"ice_candidate": candidate.toMap()};

      String iceJson = json.encode(candidateMap);

      signalingChannel.sink.add(iceJson);
    };

    RTCSessionDescription offer = await peerConnection.createOffer();
    await peerConnection.setLocalDescription(offer);
    //Be sure to modify to add a username later to the jsonbody
    Map<String, dynamic> offerMap = {"offer": offer.toMap()};

    String offerJson = json.encode(offerMap);

    print(offerJson);

    signalingChannel.sink.add(offerJson);
  }

  joinRoom({String roomID = ""}) async {
    Map<String, dynamic> joinMap = {
      "join_room": "room_name"
    }; //To be updated to use usernames

    String joinJson = json.encode(joinMap);

    print(joinJson);
    signalingChannel.sink.add(joinJson);
  }

  createAnswer(RTCVideoRenderer remoteVideo, {String roomID = ""}) async {
    // if (offerSdpDescription != null) {
    //   await peerConnection.setRemoteDescription(offerSdpDescription!);
    if (peerConnection.getRemoteDescription() != null) {
      localStream?.getTracks().forEach((track) {
        print("in answer gathering localstreams");
        peerConnection.addTrack(track, localStream!);
      });

      peerConnection.onTrack = (RTCTrackEvent event) {
        print("got remote track ${event.streams[0]}");
        print("IN ANSWER METHOD");
        event.streams[0].getTracks().forEach((track) {
          print("adding tracks to remote stream; track: $track");
          remoteStream?.addTrack(track);
        });
        remoteVideo.srcObject = remoteStream;
      };

      var answer = await peerConnection.createAnswer();
      peerConnection.setLocalDescription(answer);
      print("created answer: $answer");

      Map<String, dynamic> answerMap = {"answer": answer.toMap()};

      String answerJson = json.encode(answerMap);

      signalingChannel.sink.add(answerJson);
    } else {
      print("remote description is null, disregarding attempt to connect");
    }
    // } else {
    //   print("Tried to connect to no valid peer");
    // }
  }

  Future<void> openUserMedia(
      RTCVideoRenderer localVideo, RTCVideoRenderer remoteVideo) async {
    var stream = await navigator.mediaDevices
        .getUserMedia({'video': true, 'audio': true});

    localVideo.srcObject = stream;
    localStream = stream;

    remoteVideo.srcObject = await createLocalMediaStream('key');
  }

  Future<void> hangUp(RTCVideoRenderer localVideo) async {
    List<MediaStreamTrack> tracks = localVideo.srcObject!.getTracks();
    tracks.forEach((track) {
      track.stop();
    });

    if (remoteStream != null) {
      remoteStream!.getTracks().forEach((track) => track.stop());
    }
    peerConnection.close();

    localStream!.dispose();
    remoteStream?.dispose();
  }

  void registerPeerConnectionListeners() {
    peerConnection.onIceGatheringState = (RTCIceGatheringState state) {
      print("Ice gathering state changed: $state");
    };

    peerConnection.onConnectionState = (RTCPeerConnectionState state) {
      print("RTC connection state changed: $state");
    };

    peerConnection.onIceCandidate = (RTCIceCandidate candidate) {
      print("got candidate ${candidate.toMap()}");
    };

    peerConnection.onSignalingState = (RTCSignalingState state) {
      print("Signaling state changed: $state");
    };

    peerConnection.onIceConnectionState = (RTCIceConnectionState state) {
      print("Ice connection state changed: $state");
    };

    peerConnection.onAddStream = (MediaStream stream) {
      print("Add remote stream");
      onAddRemoteStream?.call(stream);
      remoteStream = stream;
    };
  }
}
