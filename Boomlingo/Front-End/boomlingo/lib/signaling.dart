import 'dart:convert';
import 'package:boomlingo/util/style/global_style.dart';
import 'package:flutter_webrtc/flutter_webrtc.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

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

  RTCPeerConnection? peerConnection;
  MediaStream? localStream;
  MediaStream? remoteStream;
  String? roomID;
  String? currentRoomText;
  StreamStateCallback? onAddRemoteStream;

  final signalingChannel = WebSocketChannel.connect(
    Uri(scheme: "ws", host: "10.0.2.2", port: 8080, path: "/socket"),
  );

  initChannel() async {
    await signalingChannel.ready.then((value) {
      print("Channel ready");
    });
    // signalingChannel.sink.add("random nonsense");
    signalingChannel.stream.listen((event) {
      print(event);
    });
  }

  Future<String> createRoom(RTCVideoRenderer remoteRenderer) async {
    print("Create peer connection with config $config");

    peerConnection = await createPeerConnection(config);

    registerPeerConnectionListeners();

    localStream?.getTracks().forEach((track) {
      peerConnection?.addTrack(track, localStream!);
    });

    peerConnection?.onTrack = (RTCTrackEvent trackEvent) {
      print("Got remote track ${trackEvent.streams[0]}");

      trackEvent.streams[0].getTracks().forEach((track) {
        print("Adding tracks to remote stream $track");
        remoteStream?.addTrack(track);
      });
    };

    RTCSessionDescription offer = await peerConnection!.createOffer();
    await peerConnection!.setLocalDescription(offer);
    //Be sure to modify to add a username later to the jsonbody
    Map<String, dynamic> offerMap = {"offer": offer.toMap()};

    String offerJson = json.encode(offerMap);

    print(offerJson);

    signalingChannel.sink.add(offerJson);

    return "";
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
    if (peerConnection != null) {
      peerConnection!.close();
    }

    localStream!.dispose();
    remoteStream?.dispose();
  }

  void registerPeerConnectionListeners() {
    peerConnection?.onIceGatheringState = (RTCIceGatheringState state) {
      print("Ice gathering state changed: $state");
    };

    peerConnection?.onConnectionState = (RTCPeerConnectionState state) {
      print("RTC connection state changed: $state");
    };

    peerConnection?.onIceCandidate = (RTCIceCandidate candidate) {
      print("got candidate ${candidate.toMap()}");
    };

    peerConnection?.onSignalingState = (RTCSignalingState state) {
      print("Signaling state changed: $state");
    };

    peerConnection?.onIceConnectionState = (RTCIceConnectionState state) {
      print("Ice connection state changed: $state");
    };

    peerConnection?.onAddStream = (MediaStream stream) {
      print("Add remote stream");
      onAddRemoteStream?.call(stream);
      remoteStream = stream;
    };
  }
}
