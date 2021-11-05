import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/painting.dart';
import 'kWidgets/constants.dart';
import 'package:flutter/services.dart';
import 'kWidgets/sideMenu.dart';
import 'library.dart';
import 'kWidgets/carousel.dart';
import 'package:fist_app/kWidgets/BodyCenter.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: kPrimaryColor, fontFamily: 'New_Republic'),
      home: HomeScreen(),
    ));

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final duration = Duration(milliseconds: 1000);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    final kHeight = MediaQuery.of(context).size.height;
    final kWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      drawer: myDrawer(),
      body: Container(
        height: kHeight,
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.4, 1],
          colors: [Color(0xff4339a3), Color(0xff760095)],
        )),
        child: Stack(
          children: [
            CustomScrollView(
              slivers: [
                SliverAppBar(
                  toolbarHeight: 50,
                  automaticallyImplyLeading: true,
                  //leading: myDrawer(),
                  title: Ktext(
                    inputText: 'Game Launcher',
                  ),
                  stretch: true,
                  expandedHeight: 200,
                  collapsedHeight: 80,
                  floating: true,
                  snap: true,
                  pinned: false,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Carousel(),
                    stretchModes: [
                      StretchMode.zoomBackground,
                      StretchMode.blurBackground
                    ],
                  ),
                ),
                SliverList(delegate: SliverChildListDelegate([GameRow()])),
              ],
            ),
            /* Icon Menu at the top left onPressed Would be implemented later*/

            Library(),
          ],
        ),
      ),
    );
  }
}
