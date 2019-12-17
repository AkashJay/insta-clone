import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/activity_screen.dart';
import 'package:flutter_app/screens/create_post_screen.dart';
import 'package:flutter_app/screens/feed_screen.dart';
import 'package:flutter_app/screens/profile_screen.dart';
import 'package:flutter_app/screens/search_screen.dart';


class HomeScreeen extends StatefulWidget {
  final String userId;

  HomeScreeen({this.userId});

  @override
  _HomeScreeenState createState() => _HomeScreeenState();
}

class _HomeScreeenState extends State<HomeScreeen> {

  int currentTab = 0;
  PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          'Zonegram',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Billabong',
            fontSize: 35.0,
          ),
        ),
      ),
      body: PageView(
        controller: pageController,
        children: <Widget>[

          FeedScreen(),
          SearchScreen(),
          CreatePostScreen(),
          ActivityScreen(),
          ProfileScreen(userId: widget.userId),

        ],
        onPageChanged: (int index){
          setState(() {
            currentTab  = index;
          });

        },
      ),
      bottomNavigationBar: CupertinoTabBar(

        currentIndex: currentTab,
        onTap: (int index){
          setState(() {
            currentTab = index;
          });
          pageController.animateToPage(
              index,
              duration: Duration(milliseconds: 200),
              curve: Curves.easeIn);
        },
        activeColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                size: 32.0,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 32.0,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.photo_camera,
                size: 32.0,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.notifications,
                size: 32.0,
              )
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.account_circle,
                size: 32.0,
              )
          )
        ],
      ),
    );
  }
}
