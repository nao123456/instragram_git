import 'package:flutter/material.dart';

import '../models/message_model.dart';
import 'message_box.dart';

class ChatPage extends StatefulWidget {
  final Message message;
  const ChatPage({super.key, required this.message});

  @override
  State createState() => ChatPageState();
}

class ChatPageState extends State<ChatPage> {
  final TextEditingController _chatController = TextEditingController();
  final List<Widget> _message = [];
  void _submitText(String text) {
    _chatController.clear(); // 清空controller資料
    setState(() {
      _message.insert(
          0,
          MessageBox(
            isSelf: _message.length % 2 == 0,
            text: (text),
            key: null,
          )); // 把文字存入陣列0的位置
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          leading: SizedBox(
            width: 40.0,
            height: 40.0,
            child: CircleAvatar(
              child: ClipOval(
                child: Image(
                  height: 50.0,
                  width: 50.0,
                  image: AssetImage(widget.message.authorImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          title: Text(
            widget.message.authorName,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.call,
            ),
            color: Colors.black,
            onPressed: () {},
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (context, index) => _message[index],
              itemCount: _message.length,
            ),
          ),
          Container(
            margin: const EdgeInsets.only(bottom: 16.0),
            width: 380,
            // height: 60.0,
            decoration: BoxDecoration(
              color: Colors.grey[350],
              borderRadius: const BorderRadius.all(
                Radius.circular(15.0),
              ),
            ),
            child: Row(
              children: <Widget>[
                Flexible(
                  child: TextField(
                    maxLines: null,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.camera_alt_outlined),
                      ),
                      contentPadding: const EdgeInsets.all(16.0),
                      hintText: '發送訊息...',
                      suffixIcon: IconButton(
                        // onPressed: () => _submitText(_chatController.text),
                        icon: const Icon(Icons.photo), onPressed: () {},
                      ),
                    ),
                    controller: _chatController,
                    onSubmitted: _submitText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
