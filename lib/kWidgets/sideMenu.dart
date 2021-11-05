import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/animation.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'constants.dart';

// ignore: camel_case_types
class myDrawer extends StatelessWidget {
  const myDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
      child: Drawer(
        child: Container(
          margin: EdgeInsets.only(top: 40),
          height: MediaQuery.of(context).size.height * 0.955,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(30),
              bottomRight: Radius.circular(30),
            ),
          ),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Game Launcher',
                      style: TextStyle(
                          color: mColor,
                          fontSize: mSize,
                          fontWeight: FontWeight.w800)),
                  Icon(FontAwesomeIcons.tools,
                      color: Colors.black.withOpacity(0.7), size: mSize)
                ],
              ),
            ),
            Divider(indent: 20, endIndent: 20, thickness: 1.5),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CircleAvatar(
                      minRadius: 12,
                      maxRadius: 18,
                      backgroundImage: AssetImage('images/loading (1).gif')),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Game profile',
                          style: TextStyle(color: mColor, fontSize: mSize)),
                      SizedBox(height: 5),
                      Text('  Total play time: 71 h 21 m',
                          style: TextStyle(
                              color: Colors.purple, fontSize: mSize - 5))
                    ],
                  )
                ],
              ),
            ),
            Divider(indent: 20, endIndent: 20, thickness: 1.5),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
              child: Container(
                height: menuItm.length * 38.23,
                child: ListView.builder(
                  itemCount: menuItm.length - 1,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(children: [
                      MenuItem(
                          menuItm[index].menuIcon, menuItm[index].menuText),
                    ]),
                  ),
                ),
              ),
            ),
            Divider(indent: 20, endIndent: 20, thickness: 1.5),
            Padding(
              padding: const EdgeInsets.only(
                  left: 50.0, top: 10, right: 50, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Icon(FontAwesomeIcons.discord,
                            size: mSize + 20, color: Colors.indigoAccent),
                        SizedBox(
                          height: 10,
                        ),
                        Text('Discord',
                            style:
                                TextStyle(color: mColor, fontSize: mSize - 5))
                      ],
                    ),
                    Column(
                      children: [
                        Icon(FontAwesomeIcons.googlePlay,
                            size: mSize + 19, color: Colors.green),
                        SizedBox(
                          height: 10,
                        ),
                        Text('PlayStore',
                            style:
                                TextStyle(color: mColor, fontSize: mSize - 5))
                      ],
                    ),
                  ]),
            ),
            Divider(indent: 20, endIndent: 20, thickness: 1.5),
            Padding(
              padding:
                  const EdgeInsets.only(top: 0, left: 20, right: 20, bottom: 0),
              child: Container(
                height: menuItm.length * 38.23,
                child: ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Column(children: [
                      MenuItem(menuItm[index = 4].menuIcon,
                          menuItm[index = 4].menuText),
                    ]),
                  ),
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
