import 'dart:math';

import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

class DemoApp extends StatefulWidget {
  const DemoApp({super.key});

  @override
  DemoAppState createState() => DemoAppState();
}

class DemoAppState extends State<DemoApp> {
  List<Color> colors = <Color>[];
  List<Image> images = <Image>[];
  int count = 3;
  // int count = stories.length + 1;

  Image getRandomImage(int index) {
    if (index >= images.length) {
      images.add(Image.asset(
        'assets/images/user3.jpg',
      ));
    }
    return images[index];
  }

  Color getRandomColor(int index) {
    if (index >= colors.length) {
      colors.add(Color.fromARGB(255, Random.secure().nextInt(255),
          Random.secure().nextInt(255), Random.secure().nextInt(255)));
    }
    return colors[index];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('000'),
      ),
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              height: 200,
              color: Colors.green,
              child: const Text(
                '1111',
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ),
          ),
          SliverWaterfallFlow(
            delegate: SliverChildBuilderDelegate(
              (BuildContext c, int index) {
                return Container(
                  padding: const EdgeInsets.only(top: 1, bottom: 0.5),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                    // color: getRandomColor(index),
                  ),
                  height: ((index % 3) + 1) * 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Image.asset('assets/images/user3.jpg'),
                      Image.asset('assets/images/user2.jpg'),
                      Image.asset('assets/images/user5.jpg'),
                    ],
                  ),
                );
              },
            ),
            gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
              crossAxisCount: count,
              mainAxisSpacing: 5.0,
              crossAxisSpacing: 5.0,
            ),
          ),
        ],
      ),
    );
  }
}
