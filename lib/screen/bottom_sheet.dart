import 'package:flutter/material.dart';

import '../models/bottom_model.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({
    super.key,
  });

  @override
  BottomScreenState createState() => BottomScreenState();
}

class BottomScreenState extends State<BottomScreen> {
  bool standardSelected = false;
  Widget _buildBottom(int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListTile(
        leading: SizedBox(
          width: 50.0,
          height: 50.0,
          child: CircleAvatar(
            child: ClipOval(
              child: Image(
                height: 50.0,
                width: 50.0,
                image: AssetImage(bottoms[index].authorImageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        title: Text(
          bottoms[index].authorName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(bottoms[index].id),
        trailing: IconButton(
          isSelected: standardSelected,
          icon: const Icon(Icons.circle_outlined),
          selectedIcon: const Icon(Icons.circle),
          onPressed: () {
            setState(() {
              standardSelected = !standardSelected;
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF0F6),
      body: Center(
        child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(15.0),
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
                            labelText: '搜尋',
                            prefixIcon: Icon(Icons.search),
                          ),
                          textInputAction: TextInputAction.search,
                        ),
                      ),
                    ),
                    Column(
                      children: <Widget>[
                        _buildBottom(0),
                        _buildBottom(1),
                        _buildBottom(2),
                        _buildBottom(3),
                        _buildBottom(4),
                        _buildBottom(5),
                        _buildBottom(6),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: ClipRRect(
        child: BottomNavigationBar(
          // unselectedItemColor: Colors.black,
          selectedFontSize: 10,
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline,
                size: 30.0,
                color: Colors.black,
              ),
              label: ('新增到限時動態'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.ios_share_outlined,
                size: 30.0,
                color: Colors.black,
              ),
              label: ('分享到...'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.link,
                size: 30.0,
                color: Colors.black,
              ),
              label: ('複製連結'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.message,
                size: 30.0,
                color: Colors.black,
              ),
              label: ('訊息'),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.phone,
                size: 30.0,
                color: Colors.black,
              ),
              label: ('電話'),
            ),
          ],
        ),
      ),
    );
  }
}
