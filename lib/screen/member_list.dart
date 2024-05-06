import 'package:flutter/material.dart';

class MemberScreen extends StatefulWidget {
  const MemberScreen({super.key});

  @override
  MemberScreenState createState() => MemberScreenState();
}

class MemberScreenState extends State<MemberScreen>
    with TickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            const Text(
              'XXX12345',
              style: TextStyle(
                color: Colors.black,
                fontFamily: 'Billabong',
                fontSize: 32.0,
              ),
            ),
            Row(
              children: <Widget>[
                IconButton(
                  icon: const Icon(
                    Icons.add_box_outlined,
                    color: Colors.black,
                  ),
                  iconSize: 30.0,
                  onPressed: () {},
                ),
                const SizedBox(width: 10.0),
                SizedBox(
                  width: 35.0,
                  child: IconButton(
                    icon: const Icon(
                      Icons.list_outlined,
                      color: Colors.black,
                    ),
                    iconSize: 30.0,
                    onPressed: () {},
                  ),
                )
              ],
            )
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: 195.0,
            flexibleSpace: FlexibleSpaceBar(
              background: Column(
                children: <Widget>[
                  SizedBox(
                    width: double.infinity,
                    height: 100.0,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            child: ClipOval(
                              child: Image(
                                height: 80.0,
                                width: 80.0,
                                image: AssetImage('assets/images/user0.png'),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 60,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              '15\n貼文',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              '3588\n粉絲',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              '512\n追蹤中',
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: SizedBox(
                      width: 350,
                      child: Text(
                        '五条 悟',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.grey[300], // Background color
                            ),
                            onPressed: () {},
                            child: const Text(
                              '編輯個人檔案',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 150,
                          height: 30,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  Colors.grey[300], // Background color
                            ),
                            onPressed: () {},
                            child: const Text(
                              '分享個人檔案',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          height: 30,
                          width: 50,
                          child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    Colors.grey[300], // Background color
                              ),
                              onPressed: () {},
                              child: const Icon(
                                Icons.people_alt_outlined,
                                color: Colors.black,
                              )),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverPersistentHeader(
            pinned: true,
            delegate: StickyTabBarDelegate(
              child: TabBar(
                controller: tabController,
                tabs: const <Widget>[
                  Tab(
                    icon: Icon(
                      Icons.grid_on_rounded,
                      color: Colors.black,
                    ),
                  ),
                  Tab(
                    icon: Icon(
                      Icons.person_pin_outlined,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverFillRemaining(
            child: TabBarView(
              controller: tabController,
              children: const <Widget>[
                Center(child: Text('Content of Home')),
                Center(child: Text('Content of Profile')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class StickyTabBarDelegate extends SliverPersistentHeaderDelegate {
  final TabBar child;

  StickyTabBarDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => child.preferredSize.height;

  @override
  double get minExtent => child.preferredSize.height;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
