import 'package:flutter/material.dart';

class MoreScreen extends StatefulWidget {
  const MoreScreen({
    super.key,
  });

  @override
  MoreScreenState createState() => MoreScreenState();
}

class MoreScreenState extends State<MoreScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: Container(
        width: double.infinity,
        height: 350.0,
        decoration: BoxDecoration(
          color: Colors.grey[350],
          borderRadius: BorderRadius.circular(25.0),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 400,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.person_pin,
                  size: 30,
                ),
                label: const Text(
                  "關於這個帳號",
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 400,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.volume_up_outlined,
                  size: 30,
                ),
                label: const Text(
                  "關於Instagram廣告",
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 400,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.circle_notifications_outlined,
                  size: 30,
                ),
                label: const Text(
                  "你為何會看到這則廣告",
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(foregroundColor: Colors.black),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 400,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.no_adult_content,
                  size: 30,
                ),
                label: const Text(
                  "影藏廣告",
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {},
              ),
            ),
            SizedBox(
              width: 400,
              child: TextButton.icon(
                icon: const Icon(
                  Icons.no_adult_content,
                  size: 30,
                ),
                label: const Text(
                  "檢舉廣告",
                  style: TextStyle(fontSize: 20),
                ),
                style: TextButton.styleFrom(foregroundColor: Colors.red),
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
