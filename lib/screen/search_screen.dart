import 'package:flutter/material.dart';
import 'package:waterfall_flow/waterfall_flow.dart';

import '../models/post_model.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  int count = 3;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Container(
          width: double.infinity,
          height: 40.0,
          decoration: BoxDecoration(
            color: Colors.grey[350],
            borderRadius: const BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: const TextField(
            decoration: InputDecoration(
              border: InputBorder.none,
              hintText: '搜尋',
              prefixIcon: Icon(Icons.search),
            ),
            textInputAction: TextInputAction.search,
          ),
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          // SliverGrid(
          //   gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 500.0,
          //     // mainAxisSpacing: 10.0,
          //     crossAxisSpacing: 10.0,
          //     childAspectRatio: 3.0,
          //   ),
          //   delegate: SliverChildBuilderDelegate(
          //     (BuildContext context, int index) {
          //       return Container(
          //           padding: const EdgeInsets.only(top: 1, bottom: 0.5),
          //           child: Row(
          //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //             children: <Widget>[
          //               Image.asset('assets/images/user3.jpg'),
          //               Image.asset('assets/images/user2.jpg'),
          //               Image.asset('assets/images/user5.jpg'),
          //             ],
          //           ));
          //     },
          //     childCount: 20,
          //   ),
          // ),
          SliverWaterfallFlow(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Image(
                    image: AssetImage(stories[index % stories.length]),
                    // fit: BoxFit.cover,
                  );
                },
              ),
              gridDelegate: SliverWaterfallFlowDelegateWithFixedCrossAxisCount(
                crossAxisCount: count,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
              ))
        ],
      ),
    );
  }
}
