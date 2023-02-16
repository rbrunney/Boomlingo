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

  final YoutubePlayerController _controller = YoutubePlayerController(
      initialVideoId: 'gPPxfPThq20',
      flags: const YoutubePlayerFlags(
          autoPlay: false,
          mute: true,
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
                            fontWeight: FontWeight.bold
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 50,
                          width: 50,
                          child: Card(
                            color: const Color(global_style.darkBlueAccentColor),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Icon(Icons.checklist_rounded, color: Color(global_style.whiteAccentColor),),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    width: MediaQuery.of(context).size.width * 0.90,
                    child: Card(
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: const BorderRadius.only(topRight: Radius.circular(15), topLeft: Radius.circular(15)), 
                            child: YoutubePlayer(
                              controller: _controller,
                              showVideoProgressIndicator: true
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                            child: Row(
                              children: const [
                                Icon(Ionicons.volume_high_outline),
                                Spacer(),
                                Icon(Ionicons.md_play_skip_back_outline),
                                Spacer(),
                                Icon(Ionicons.pause_outline),
                                Spacer(),
                                Icon(Ionicons.md_play_skip_forward_outline),
                                Spacer(),
                                Icon(MaterialCommunityIcons.arrow_expand)
                              ],
                            )
                          )
                        ],
                      )
                    )
                  ),
                  SizedBox(
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 20),
                      child: Card(
                        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                        child: Row(
                          children: const [
                            CircleAvatar(
                              radius: 30,
                              backgroundColor: Colors.black,
                            ),
                            Spacer(),
                            Icon(Ionicons.md_chevron_up_outline)
                          ]
                        )
                      )
                    )
                  )
                ],
              ),
            )
          )
    );
  }
}
