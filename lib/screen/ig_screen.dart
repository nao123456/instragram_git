import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instragram/screen/message_screen.dart';
import 'package:instragram/screen/more.dart';
import 'package:instragram/screen/notify_screen.dart';
import 'package:instragram/screen/search_screen.dart';
import 'package:instragram/screen/view_post_screen.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../main.dart';
import '../models/post_model.dart';
import 'bottom_sheet.dart';
import 'camera_screen.dart';
import 'member_list.dart';

class IgScreen extends StatefulWidget {
  const IgScreen({super.key});

  @override
  IgScreenState createState() => IgScreenState();
}

class IgScreenState extends State<IgScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    box.listenable.addListener(_update);
  }

  @override
  void dispose() {
    super.dispose();
    box.listenable.removeListener(_update);
  }

  _update() => setState(() {});

  final box = StoreBox();
  Widget _buildPost(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 430.0,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: Container(
                      width: 50.0,
                      height: 50.0,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 2),
                            blurRadius: 6.0,
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        child: ClipOval(
                          child: Image(
                            height: 50.0,
                            width: 50.0,
                            image: AssetImage(posts[index].authorImageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    title: Text(
                      posts[index].authorName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(posts[index].timeAgo),
                    trailing: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      color: Colors.black,
                      onPressed: () {
                        showModalBottomSheet<void>(
                          context: context,
                          builder: (BuildContext context) {
                            return const MoreScreen();
                          },
                        );
                      },
                    ),
                  ),
                  InkWell(
                    onDoubleTap: () {
                      if (box.isFavorite(posts[index].id)) {
                        box.remove(posts[index].id);
                      } else {
                        box.addFavorite(posts[index].id);
                      }
                    },
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ViewPostScreen(
                            post: posts[index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      width: double.infinity,
                      height: 200.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black45,
                            offset: Offset(0, 5),
                            blurRadius: 8.0,
                          ),
                        ],
                        image: DecorationImage(
                          image: AssetImage(posts[index].imageUrl),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            IconButton(
                              isSelected: box.isFavorite(posts[index].id),
                              icon: const Icon(Icons.favorite_border),
                              selectedIcon: const Icon(
                                Icons.favorite,
                                color: Colors.red,
                              ),
                              iconSize: 30.0,
                              onPressed: () {
                                if (box.isFavorite(posts[index].id)) {
                                  box.remove(posts[index].id);
                                } else {
                                  box.addFavorite(posts[index].id);
                                }
                              },
                            ),
                            const SizedBox(width: 8.0),
                            IconButton(
                              icon: const Icon(Icons.chat),
                              iconSize: 30.0,
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => ViewPostScreen(
                                      post: posts[index],
                                    ),
                                  ),
                                );
                              },
                            ),
                            const SizedBox(width: 8.0),
                            IconButton(
                              icon: const Icon(Icons.send_rounded),
                              iconSize: 30.0,
                              onPressed: () {
                                showModalBottomSheet<void>(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return const BottomScreen();
                                  },
                                );
                              },
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              isSelected: box.isFavorite(posts[index].mark),
                              icon: const Icon(Icons.bookmark_border),
                              selectedIcon: const Icon(
                                Icons.bookmark_added,
                                color: Colors.black,
                              ),
                              iconSize: 30.0,
                              onPressed: () {
                                if (box.isFavorite(posts[index].mark)) {
                                  box.remove(posts[index].mark);
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.white,
                                    content: const Text('已移除貼文',
                                        style: TextStyle(color: Colors.blue)),
                                    action: SnackBarAction(
                                      textColor: Colors.blue,
                                      label: 'close',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                } else {
                                  box.addFavorite(posts[index].mark);
                                  final snackBar = SnackBar(
                                    backgroundColor: Colors.white,
                                    content: const Text('已儲存貼文',
                                        style: TextStyle(color: Colors.blue)),
                                    action: SnackBarAction(
                                      textColor: Colors.blue,
                                      label: 'close',
                                      onPressed: () {
                                        // Some code to undo the change.
                                      },
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                }
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                    width: 350,
                    child: Text(
                      posts[index].message,
                      // softWrap: true,
                      // overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.left,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  bool standardSelected = false;
  void _onRefresh() async {
    await Future.delayed(const Duration(milliseconds: 1000));
    _refreshController.refreshCompleted();
    if (mounted) {
      setState(() {});
    }
  }

  void _onLoading() async {
    await Future.delayed(const Duration(milliseconds: 1000));

    if (mounted) {
      setState(() {});
    }
    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: SmartRefresher(
        enablePullUp: true,
        controller: _refreshController,
        onRefresh: _onRefresh,
        onLoading: _onLoading,
        child: ListView(
          physics: const AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    const Text(
                      'Instagram',
                      style: TextStyle(fontFamily: 'Billabong', fontSize: 32.0),
                    ),
                    Row(
                      children: <Widget>[
                        IconButton(
                          icon: const Icon(Icons.favorite_border),
                          iconSize: 32.0,
                          onPressed: () {
                            Navigator.push(
                              context,
                              CupertinoPageRoute(
                                builder: (context) => const NotifyScreen(),
                              ),
                            );
                          },
                        ),
                        const SizedBox(width: 16.0),
                        SizedBox(
                          width: 35.0,
                          child: IconButton(
                            icon: const Icon(Icons.chat_outlined),
                            iconSize: 30.0,
                            onPressed: () {
                              Navigator.push(
                                context,
                                CupertinoPageRoute(
                                  builder: (context) => const MessageScreen(),
                                ),
                              );
                            },
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 80.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: stories.length + 1,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 0) {
                    return const SizedBox(width: 10.0);
                  }
                  return Container(
                    margin: const EdgeInsets.all(10.0),
                    width: 60.0,
                    height: 60.0,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      child: ClipOval(
                        child: Image(
                          height: 60.0,
                          width: 60.0,
                          image: AssetImage(stories[index - 1]),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const Divider(
              color: Colors.grey,
              height: 20,
              thickness: 1,
              indent: 20,
              endIndent: 0,
            ),
            _buildPost(0),
            _buildPost(1),
            _buildPost(2),
            _buildPost(3),
            _buildPost(4),
          ],
        ),
      ),
    );
  }
}

class BottomNavigationWidget extends StatefulWidget {
  const BottomNavigationWidget({super.key});

  @override
  State<StatefulWidget> createState() => BottomNavigationWidgetState();
}

class BottomNavigationWidgetState extends State<BottomNavigationWidget> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    const IgScreen(),
    const SearchScreen(),
    const ExampleInstagramFilterSelection(),
    const Placeholder(),
    const MemberScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home_filled,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.search,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.add_box_outlined,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.ondemand_video,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_outline,
              color: Colors.black,
              size: 30.0,
            ),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: (int index) {
          if (kDebugMode) {
            print(index);
          }
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
    );
  }
}
