import 'package:fist_app/kWidgets/games.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
//import 'package:auto_size_text/auto_size_text.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'Instant_plays.dart';

class GameRow extends StatefulWidget {
  const GameRow({Key? key}) : super(key: key);

  @override
  _GameRowState createState() => _GameRowState();
}

class _GameRowState extends State<GameRow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 1.158,
      child: Column(children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 18.0, right: 18, top: 16, bottom: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Text(
                    'Recent',
                    style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w800),
                  ),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: Colors.white,
                  )
                ],
              ),
              Row(
                children: [
                  FaIcon(FontAwesomeIcons.user, color: Colors.white, size: 16),
                  SizedBox(width: 18),
                  FaIcon(
                    FontAwesomeIcons.volumeUp,
                    size: 16,
                    color: Colors.white,
                  )
                ],
              ),
            ],
          ),
        ), //////Recent > buttons
        Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games.length - 10,
            itemBuilder: (BuildContext context, int index) => Row(
              children: [
                SizedBox(width: 8),
                Container(
                  width: 145,
                  decoration: BoxDecoration(
                    color: Color(0x34ffffff),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: 123,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              PopUp()));
                                },
                                child: Container(
                                  height: 90,
                                  width: 85,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(games[index].image),
                                        fit: BoxFit.cover),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(35)),
                                  ),
                                ),
                              ),
                            ),
                            Icon(
                              Icons.info,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Expanded(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                games[index].title,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                  fontSize: 18,
                                ),
                              ),

                              /////time ////////
                              Text(
                                time[index].time,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14),
                              ),
                              ///////Today ///Yesterday
                              Text(
                                time[index].tod,
                                textAlign: TextAlign.center,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400,
                                    fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: 8),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12, top: 20),
          child: InkWell(
            splashColor: Colors.white,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => detailsPage()));
            },
            child: Row(
              //Row for Instant Plays///////////////
              children: [
                Text(
                  'Instant Plays',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ),

        Container(
          //padding: EdgeInsets.only(bottom: 80),
          //color: Colors.white,
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: games.length - 9,
            itemBuilder: (BuildContext context, int index) => Hero(
              tag: 'tag$index',
              child: InkWell(
                splashColor: Colors.white,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (BuildContext context) => detailsPage()));
                },
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Container(
                      height: 230,
                      width: 280,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(games[index].image),
                            fit: BoxFit.cover),
                        color: Color(0x34ffffff),
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Stack(
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.0822,
                            margin: EdgeInsets.only(top: 165),
                            decoration: BoxDecoration(
                              color: Color(0xff875592),
                              borderRadius: BorderRadius.only(
                                  bottomRight: Radius.circular(12),
                                  bottomLeft: Radius.circular(12)),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(12.0),
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                      games[index].image,
                                    ),
                                    maxRadius: 25,
                                    minRadius: 20,
                                  ),
                                  SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(games[index].title,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.w800)),
                                      Text(games[index].description,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontWeight: FontWeight.w800)),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    top: 16.0, right: 16, bottom: 70),
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    FaIcon(FontAwesomeIcons.ellipsisV,
                                        color: Colors.white),
                                    FaIcon(FontAwesomeIcons.burn,
                                        color: Colors.white)
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ),
                    //SizedBox(width: 10),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 0, top: 12),
          child: Row(
              //Row for Instant Plays///////////////
              children: [
                Text(
                  'Instant Plays Categories',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.w800),
                ),
                SizedBox(
                  width: 10,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 20,
                  color: Colors.white,
                ),
              ]),
        ),
        Container(
          height: 250,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(12),
          ),
          child: GridView.builder(
              padding: EdgeInsets.all(16),
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 4 / 2,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10),
              scrollDirection: Axis.vertical,
              itemCount: games.length - 12,
              itemBuilder: (BuildContext context, int index) => Container(
                    width: 150,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(games[index].image),
                          fit: BoxFit.cover),
                      color: Color(0x34ffffff),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Stack(children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Color(0x86282828),
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      Center(
                          child: Text(
                        genre[index],
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 18),
                      )),
                    ]),
                  )),
        ),
      ]),
    );
  }
}
