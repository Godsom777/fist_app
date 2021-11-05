import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'games.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primaryColor: Color(0xffd6d6d6)),
      home: detailsPage(),
    );
  }
}

class detailsPage extends StatefulWidget {
  const detailsPage({Key? key}) : super(key: key);

  @override
  _detailsPageState createState() => _detailsPageState();
}

class _detailsPageState extends State<detailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffd6d6d6),
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xf20c0c0c)),
        backgroundColor: Color(0xffd6d6d6),
        shadowColor: Colors.transparent,
        title: Text(
          'Instant plays',
          style: TextStyle(color: Color(0xF20C0C0C), fontSize: 18),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height * games.length,
        child: ListView(scrollDirection: Axis.vertical, children: [
          Padding(
            padding: const EdgeInsets.only(left: 16.0, top: 16),
            child: Container(
                decoration: BoxDecoration(
                  //borderRadius: BorderRadius.circular(30),
                  color: Color(0xffd7d7d7),
                ),
                child: Column(children: [
                  Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Suggested for you',
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.black45,
                            fontWeight: FontWeight.w800),
                      )),
                  SizedBox(
                    height: 10,
                  ),

                  //
                ])),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 18.0, left: 18, right: 18),
            child: Column(children: [
              Container(
                height: 200,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        image: AssetImage('images/(9).jpeg'),
                        fit: BoxFit.fill)),
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('images/(2).jpg'),
                    minRadius: 12,
                    maxRadius: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(' Fornite',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.black87,
                              fontWeight: FontWeight.w800)),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.5,
                        child: Text(' Unity Games Presents a Roster',
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            // maxFontSize: 16,
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black45.withOpacity(0.3),
                              fontWeight: FontWeight.w800,
                            )),
                      ),
                    ],
                  ),
                  SizedBox(width: 30),
                  Expanded(
                      child: TextButton(
                    onPressed: () {},
                    style: ButtonStyle(
                        minimumSize:
                            MaterialStateProperty.all<Size>(Size(90, 40)),
                        maximumSize:
                            MaterialStateProperty.all<Size>(Size(100, 40)),
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        )),
                        backgroundColor:
                            MaterialStateProperty.all(Colors.black12)),
                    child: Text(
                      'Play',
                      style: TextStyle(color: Colors.black87, fontSize: 16),
                    ),
                  )),
                ],
              ),
            ]),
          ),
          Divider(
            color: Colors.black.withOpacity(0.4),
            indent: 25,
            endIndent: 25,
          ),
          Container(
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20),
              Text('     Discover more instant plays',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      fontWeight: FontWeight.w800)),
              SizedBox(height: 10),
              SizedBox(
                height: 60,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: genre.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: TextButton(
                      onPressed: () {},
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(
                              BorderSide(color: Colors.black, width: 1.345)),
                          shape:
                              MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          )),
                          backgroundColor:
                              MaterialStateProperty.all(Colors.transparent)),
                      child: Text(
                        genre[index],
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 16,
                            fontWeight: FontWeight.w900),
                        maxLines: 1,
                        //wrapWords: false,
                      ),
                    ),
                  ),
                ),
              ),
            ]),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              color: Color(0xffeeeeee),
              borderRadius: BorderRadius.circular(30),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                primary: true,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: games.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                ),
                itemBuilder: (BuildContext context, int index) => Container(
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(children: [
                      Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(
                                image: AssetImage(games[index].image),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(height: 10),
                      Row(
                        children: [
                          CircleAvatar(
                            backgroundImage: AssetImage(games[index].image),
                            minRadius: 10,
                            maxRadius: 18,
                          ),
                          SizedBox(width: 5),
                          Flexible(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    games[index].title,
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.black87,
                                        fontWeight: FontWeight.w800),
                                    // minFontSize: 12,
                                    softWrap: false, maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Text(
                                    games[index].description,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.blueGrey,
                                        fontWeight: FontWeight.w800),
                                    // minFontSize: 8,
                                    softWrap: false, maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ]),
                          )
                        ],
                      )
                    ]),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}

class PopUp extends StatefulWidget {
  const PopUp({Key? key}) : super(key: key);

  @override
  _PopUpState createState() => _PopUpState();
}

class _PopUpState extends State<PopUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        //color: Colors.transparent,
        child: Center(
            child: Hero(
          tag: 123,
          child: InkWell(
            onTap: () {
              Navigator.pop(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => PopUp()));
            },
            child: Center(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    Image(
                        image: AssetImage("images/loading (2).gif"),
                        fit: BoxFit.fitWidth),
                    Text(
                      'Game is Starting...',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.blueGrey,
                          fontWeight: FontWeight.w800),
                      //minFontSize: 8,
                      softWrap: false, maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),
            ),
          ),
        )),
      ),
    );
  }
}
