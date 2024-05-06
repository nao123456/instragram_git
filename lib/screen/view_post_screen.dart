import 'package:flutter/material.dart';

import '../main.dart';
import '../models/comment_model.dart';
import '../models/post_model.dart';
import 'more.dart';

class ViewPostScreen extends StatefulWidget {
  final Post post;

  const ViewPostScreen({super.key, required this.post});

  @override
  ViewPostScreenState createState() => ViewPostScreenState();
}

class ViewPostScreenState extends State<ViewPostScreen> {
  final box = StoreBox();
  Widget _buildComment(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
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
                image: AssetImage(comments[index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          comments[index].authorName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(comments[index].text),
        trailing: IconButton(
          isSelected: box.isFavorite(comments[index].like),
          icon: const Icon(
            Icons.favorite_border,
          ),
          color: Colors.grey,
          selectedIcon: const Icon(
            Icons.favorite,
            color: Colors.red,
          ),
          onPressed: () {
            if (box.isFavorite(comments[index].like)) {
              box.remove(comments[index].like);
            } else {
              box.addFavorite(comments[index].like);
            }
            setState(
              () {},
            );
          },
        ),
      ),
    );
  }

  bool standardSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              padding: const EdgeInsets.only(top: 40.0),
              width: double.infinity,
              height: 520.0,
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
                              child: ListTile(
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
                                        image: AssetImage(
                                            widget.post.authorImageUrl),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                                title: Text(
                                  widget.post.authorName,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text(widget.post.timeAgo),
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
                            ),
                          ],
                        ),
                        InkWell(
                          onDoubleTap: () {
                            if (box.isFavorite(widget.post.id)) {
                              box.remove(widget.post.id);
                            } else {
                              box.addFavorite(widget.post.id);
                            }
                            setState(() {});
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
                                image: AssetImage(widget.post.imageUrl),
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
                                    isSelected: box.isFavorite(widget.post.id),
                                    icon: const Icon(Icons.favorite_border),
                                    iconSize: 30.0,
                                    selectedIcon: const Icon(
                                      Icons.favorite,
                                      color: Colors.red,
                                    ),
                                    onPressed: () {
                                      if (box.isFavorite(widget.post.id)) {
                                        box.remove(widget.post.id);
                                      } else {
                                        box.addFavorite(widget.post.id);
                                      }
                                      setState(
                                        () {},
                                      );
                                    },
                                  ),
                                  Text(
                                    widget.post.like,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(width: 20.0),
                                  IconButton(
                                    icon: const Icon(Icons.chat),
                                    iconSize: 30.0,
                                    onPressed: () {
                                      print('Chat');
                                    },
                                  ),
                                  Text(
                                    widget.post.msCount,
                                    style: const TextStyle(
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                              IconButton(
                                isSelected: box.isFavorite(widget.post.mark),
                                icon: const Icon(Icons.bookmark_border),
                                iconSize: 30.0,
                                selectedIcon: const Icon(
                                  Icons.bookmark_added,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  if (box.isFavorite(widget.post.mark)) {
                                    box.remove(widget.post.mark);
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.white,
                                      content: const Text('已移除貼文',
                                          style: TextStyle(color: Colors.blue)),
                                      action: SnackBarAction(
                                        textColor: Colors.blue,
                                        label: 'close',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  } else {
                                    box.addFavorite(widget.post.mark);
                                    final snackBar = SnackBar(
                                      backgroundColor: Colors.white,
                                      content: const Text('已儲存貼文',
                                          style: TextStyle(color: Colors.blue)),
                                      action: SnackBarAction(
                                        textColor: Colors.blue,
                                        label: 'close',
                                        onPressed: () {},
                                      ),
                                    );
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  }
                                  setState(
                                    () {},
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 100,
                          width: 350,
                          child: Text(
                            widget.post.message,
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
            const SizedBox(height: 10.0),
            Container(
              width: double.infinity,
              height: 600.0,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.0),
                  topRight: Radius.circular(30.0),
                ),
              ),
              child: Column(
                children: <Widget>[
                  _buildComment(0),
                  _buildComment(1),
                  _buildComment(2),
                  _buildComment(3),
                  _buildComment(4),
                  _buildComment(5),
                ],
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Transform.translate(
        offset: Offset(0.0, -1 * MediaQuery.of(context).viewInsets.bottom),
        child: Container(
          height: 100.0,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0),
              topRight: Radius.circular(30.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                offset: Offset(0, -2),
                blurRadius: 6.0,
              ),
            ],
            color: Colors.white,
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                contentPadding: const EdgeInsets.all(20.0),
                hintText: 'コメントを追加する',
                prefixIcon: Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 48.0,
                  height: 48.0,
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
                        height: 48.0,
                        width: 48.0,
                        image: AssetImage(widget.post.authorImageUrl),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 4.0),
                  width: 70.0,
                  child: IconButton(
                    color: const Color(0xFF23B66F),
                    onPressed: () => print('Post comment'),
                    icon: const Icon(
                      Icons.send,
                      size: 25.0,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
