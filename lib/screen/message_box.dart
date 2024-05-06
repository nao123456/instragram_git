import 'package:flutter/material.dart';

class MessageBox extends StatelessWidget {
  final String text;

  final bool isSelf;
  const MessageBox({required key, required this.text, required this.isSelf})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:
            isSelf ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: isSelf ? _buildList() : _buildList().reversed.toList(),
      ),
    );
  }

  List<Widget> _buildList() => [
        const Spacer(
          flex: 1,
        ),
        Flexible(
          flex: 3,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(25.0),
            ),
            padding: const EdgeInsets.all(10.0),
            child: Text(text,
                // overflow: TextOverflow.ellipsis,
                // maxLines: 5,
                style: const TextStyle(fontSize: 18.0, color: Colors.white)),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        const CircleAvatar(
          radius: 25,
          child: ClipOval(
            child: Image(
              height: 80.0,
              width: 80.0,
              image: AssetImage('assets/images/user0.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ];
}
