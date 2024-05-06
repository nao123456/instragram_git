import 'package:flutter/material.dart';

class NotifyScreen extends StatefulWidget {
  const NotifyScreen({
    super.key,
  });

  @override
  NotifyScreenState createState() => NotifyScreenState();
}

class NotifyScreenState extends State<NotifyScreen> {
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
              height: 1000,
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
                              child: const Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    '通知',
                                    style: TextStyle(
                                      fontFamily: 'Billabong',
                                      fontSize: 32.0,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const Column(
                          children: [
                            SizedBox(height: 10.0),
                            SizedBox(
                              width: 380,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '新的動態',
                                    textAlign: TextAlign.left,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                            // Column(
                            //   children: <Widget>[
                            //     _buildMessage(0),
                            //     _buildMessage(1),
                            //     _buildMessage(2),
                            //     _buildMessage(3),
                            //     _buildMessage(4),
                            //     _buildMessage(5),
                            //     _buildMessage(6),
                            //   ],
                            // ),
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
