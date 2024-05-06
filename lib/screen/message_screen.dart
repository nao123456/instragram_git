import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../models/message_model.dart';
import '../models/post_model.dart';
import 'chat_room.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({
    super.key,
  });

  @override
  MessageScreenState createState() => MessageScreenState();
}

class MessageScreenState extends State<MessageScreen> {
  final RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  Widget _buildMessage(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => ChatPage(
                message: messages[index],
              ),
            ),
          );
        },
        child: ListTile(
          leading: SizedBox(
            width: 50.0,
            height: 50.0,
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 50.0,
                  width: 50.0,
                  image: AssetImage(messages[index].authorImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(
            messages[index].authorName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          subtitle: Text(messages[index].text),
          trailing: IconButton(
            icon: const Icon(
              Icons.camera_alt_outlined,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ),
    );
  }

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
        physics: const AlwaysScrollableScrollPhysics(),
        child: ListView(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              width: double.infinity,
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            IconButton(
                              icon: const Icon(Icons.arrow_back),
                              iconSize: 30.0,
                              color: Colors.black,
                              onPressed: () => Navigator.pop(context),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  const Text(
                                    'XXX12345',
                                    style: TextStyle(
                                      fontFamily: 'Billabong',
                                      fontSize: 32.0,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(Icons.newspaper),
                                    iconSize: 30.0,
                                    onPressed: () {},
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Container(
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
                            const SizedBox(height: 10.0),
                            SizedBox(
                              width: 380,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    '訊息',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '陌生訊息',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.grey[700]),
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: <Widget>[
                                _buildMessage(0),
                                _buildMessage(1),
                                _buildMessage(2),
                                _buildMessage(3),
                                _buildMessage(4),
                                _buildMessage(5),
                                _buildMessage(6),
                                _buildMessage(1),
                                _buildMessage(3),
                                _buildMessage(5),
                              ],
                            ),
                          ],
                        ),
                      ],
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
}
