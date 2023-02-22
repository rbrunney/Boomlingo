import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: Stack(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        children: [
          Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.black,
                  ),
                  Column(children: [
                    Container(child: Text("Alex"),)
                  ],)
                ],
              ),
              Row()
            ],
          ),
          Column()
        ],
      )),
    );
  }
}
