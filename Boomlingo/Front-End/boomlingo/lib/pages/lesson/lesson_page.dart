import 'package:flutter/material.dart';
import 'package:boomlingo/util/style/global_style.dart' as global_style;
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class LessonPage extends StatefulWidget {
  const LessonPage({Key? key}) : super(key: key);

  @override
  State<LessonPage> createState() => _LessonPageState();
}

class _LessonPageState extends State<LessonPage> {
  bool isVideoPlaying = false;
  bool isVideoMute = false;

  final YoutubePlayerController _controller = YoutubePlayerController(
    initialVideoId: 'gPPxfPThq20',
    flags: const YoutubePlayerFlags(
      autoPlay: false,
      mute: false,
    ),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            backgroundColor: const Color(global_style.pageBackgroundColor),
            body: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(
                        vertical: MediaQuery.of(context).size.height * 0.05,
                        horizontal: MediaQuery.of(context).size.width * 0.05),
                    child: Row(
                      children: [
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.arrow_back_rounded),
                          ),
                        ),
                        const Spacer(),
                        Text(
                          'What The Dog Doin',
                          style: TextStyle(
                              fontSize: 18,
                              fontFamily: global_style.textFont,
                              fontWeight: FontWeight.bold),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            color:
                                const Color(global_style.darkBlueAccentColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(
                              Icons.checklist_rounded,
                              color: Color(global_style.whiteAccentColor),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                      height: MediaQuery.of(context).size.height * 0.35,
                      width: MediaQuery.of(context).size.width * 0.90,
                      child: Card(
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius: const BorderRadius.only(
                                    topRight: Radius.circular(15),
                                    topLeft: Radius.circular(15)),
                                child: YoutubePlayer(
                                    controller: _controller,
                                    showVideoProgressIndicator: true),
                              ),
                              Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 12),
                                  child: Row(
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVideoMute = !isVideoMute;

                                              if (isVideoMute) {
                                                _controller.mute();
                                              } else {
                                                _controller.unMute();  
                                              }
                                            });
                                          },
                                          icon: Icon(isVideoMute
                                              ? Ionicons.volume_mute_outline
                                              : Ionicons.volume_high_outline)),
                                      const Spacer(),
                                      const Icon(
                                          Ionicons.md_play_skip_back_outline),
                                      const Spacer(),
                                      IconButton(
                                          onPressed: () {
                                            setState(() {
                                              isVideoPlaying = !isVideoPlaying;

                                              if (isVideoPlaying) {
                                                _controller.play();
                                              } else {
                                                _controller.pause();  
                                              }
                                            });
                                          },
                                          icon: Icon(isVideoPlaying
                                              ? Ionicons.pause_outline
                                              : Ionicons.play_outline)),
                                      const Spacer(),
                                      const Icon(Ionicons
                                          .md_play_skip_forward_outline),
                                      const Spacer(),
                                      const Icon(
                                          MaterialCommunityIcons.arrow_expand)
                                    ],
                                  ))
                            ],
                          ))),
                  SizedBox(
                      child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.05,
                              vertical: 20),
                          child: Card(
                              shape: const RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: Row(children: const [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundColor: Colors.black,
                                ),
                                Spacer(),
                                Icon(Ionicons.md_chevron_up_outline)
                              ]))))
                ],
              ),
            )));
  }
}
