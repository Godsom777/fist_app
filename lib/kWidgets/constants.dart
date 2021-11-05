import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final _duration = Duration(milliseconds: 600);
final kPrimaryColor = Color(0xff002b40);
final kAccentColor = Color(0xffffffff);
final kShadow = BoxShadow(
    blurRadius: 3.4,
    color: Colors.black54,
    offset: Offset(5, 5),
    spreadRadius: 25);

class Ktext extends StatefulWidget {
  String inputText;

  Ktext({required this.inputText});

  @override
  State<Ktext> createState() => _KtextState();
}

class _KtextState extends State<Ktext> {
/////////////////////////FOR TXT////////////////////
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.inputText,
      style: TextStyle(color: Color(0xffffffff), fontSize: 22),
      overflow: TextOverflow.ellipsis,
      maxLines: 1,
    );
  }
}

///////////////////////////////////////////////////////////////////////////////////////////////

class MenuItem extends StatefulWidget {
  final IconData mIcon;
  final String mText;

  MenuItem(this.mIcon, this.mText);

  @override
  _MenuItemState createState() => _MenuItemState();
}

final Color mColor = Color(0xff0e0e0e);
final double mSize = 18;

class _MenuItemState extends State<MenuItem> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Icon(widget.mIcon, color: Colors.black.withOpacity(0.7), size: mSize),
      SizedBox(width: 20),
      Text(widget.mText,
          style: TextStyle(
              color: mColor, fontSize: mSize, fontWeight: FontWeight.w800))
    ]);
  }
}

class SideMenu {
  final IconData menuIcon;
  final String menuText;

  SideMenu(this.menuIcon, this.menuText);
}

List<SideMenu> menuItm = [
  // SideMenu (FontAwesomeIcons.user,  'Gamer profile'),
  SideMenu(FontAwesomeIcons.crown, 'Game ranking'),
  SideMenu(FontAwesomeIcons.bell, 'Game notifications'),
  SideMenu(FontAwesomeIcons.gift, 'Benefits'),
  SideMenu(FontAwesomeIcons.gamepad, 'Game performance'),
  SideMenu(FontAwesomeIcons.watchmanMonitoring, 'Notices'),
];
