import 'package:flutter/material.dart';
import 'package:whatsapp_clone/Pages/chat_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  TabController? _controller;
  @override
  void initState() {
    _controller = TabController(length: 4, vsync: this, initialIndex: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 4,
        child: NestedScrollView(
          physics: ClampingScrollPhysics(),
          headerSliverBuilder: (context, value) {
            return [
              SliverAppBar(
                floating: true,
                pinned: true,
                title: Text("Whatsapp Clone"),
                actions: [
                  IconButton(icon: Icon(Icons.search), onPressed: () {}),
                  PopupMenuButton<String>(itemBuilder: (BuildContext context){
                   return [ PopupMenuItem(
                      child: Text("New Group"),

                    ),
                    PopupMenuItem(
                      child: Text("New Broadcast"),

                    ),
                    PopupMenuItem(
                    child: Text("Whatsapp Web"),

                    ),
                    PopupMenuItem(
                    child: Text("Starred Message"),

                    ),
                    PopupMenuItem(
                    child: Text("Settings"),

                    ),];

                  })
                ],
                bottom: TabBar(
                  indicatorColor: Colors.white,
                  controller: _controller,
                  tabs: [
                    Tab(

                      icon: Icon(Icons.camera),
                    ),
                    Tab(text: "Chats"),
                    Tab(text: "Status"),
                    Tab(text: "Calls"),
                  ],
                ),
              ),
            ];
          },
          body: TabBarView(
            controller: _controller,
            children: [
              Text("camera"),
              ChatPage(),
              Text("status"),
              Text("calls")
            ],
          ),
        ),
      ),
    );
  }
}
