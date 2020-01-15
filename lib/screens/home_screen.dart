import 'package:chat_online/tabs/chat_tab.dart';
import 'package:chat_online/tabs/dicas_tab.dart';
import 'package:chat_online/tabs/home_tab.dart';
import 'package:chat_online/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {

  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      controller: _pageController,
      physics: NeverScrollableScrollPhysics(),
      children: <Widget>[
        Scaffold(
          body: HomeTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(title: Text("Chat"),
              centerTitle: true),
          body: ChatTab(),
          drawer: CustomDrawer(_pageController),
        ),
        Scaffold(
          appBar: AppBar(title: Text("Dicas"),
              centerTitle: true),
          body: DicasTab(),
          drawer: CustomDrawer(_pageController),
        ),
      ],
    );
  }
}