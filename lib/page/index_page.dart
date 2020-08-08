import 'chat_page.dart';
import 'product_page.dart';
import 'package:abc/provider/current_index_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'home_page.dart';

class IndexPage extends StatefulWidget {
  @override
  IndexPageState createState() => IndexPageState();
}

class IndexPageState extends State<IndexPage> {
  bool socketInited = false;

  // void initState() {
  //   super.initState();
  // }
  HomePage homepage;
  ProductPage productPage;
  ChatPage chatPage;

  dynamic currentPage() {
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    switch (currentIndex) {
      case 0:
        if (homepage == null) {
          homepage = new HomePage();
        }
        return homepage;
      case 1:
        if (productPage == null) {
          productPage = new ProductPage();
        }
        return productPage;
      case 1:
        if (chatPage == null) {
          chatPage = new ChatPage();
        }
        return chatPage;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!socketInited) {
      socketInited = true;
    }
    int currentIndex = Provider.of<CurrentIndexProvider>(context).currentIndex;
    return Scaffold(
      appBar: AppBar(
        title: Text('test page'),
        leading: Icon(Icons.home),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {},
              child: Icon(Icons.search),
            ),
          ),
        ],
      ),
      body: currentPage(),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          Provider.of<CurrentIndexProvider>(context).changeIndex(index);
        },
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), title: Text('home')),
          BottomNavigationBarItem(
              icon: Icon(Icons.apps), title: Text('product')),
          BottomNavigationBarItem(
              icon: Icon(Icons.insert_chart), title: Text('contact')),
        ],
      ),
    );
  }
}
