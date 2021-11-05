import 'dart:math' as math;
import 'dart:ui';

// ignore: import_of_legacy_library_into_null_safe
//import 'package:auto_size_text/auto_size_text.dart';
import 'package:fist_app/kWidgets/constants.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

import 'kWidgets/games.dart';

class Library extends StatefulWidget {
  @override
  State<Library> createState() => _LibraryState();
}

class _LibraryState extends State<Library> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  double get maxHeight => MediaQuery.of(context).size.height - 40;
  double imgStartSize = 45;
  double imgEndSize = 120;
  double verticalSpace = 25;
  double horizontalSpace = 15;
  Color colorRiot1 = Color(0xfd05daf6);
  Color colorRiot2 = kPrimaryColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 600),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  double? lerp(double min, double max) {
    return lerpDouble(min, max, _controller.value);
  }

  void toggle() {
    final bool isCompleted = _controller.status == AnimationStatus.completed;
    _controller.fling(velocity: isCompleted ? -1 : 1);
  }

  void verticalDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta! / maxHeight;
  }

  void verticalDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;

    if (flingVelocity < 0) {
      _controller.fling(velocity: math.max(1, -flingVelocity));
    } else if (flingVelocity > 0) {
      _controller.fling(velocity: math.min(-1, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -1 : 1);
    }
  }

  double? gameTopMargin(int index) {
    return lerp(20, 10 + index * (verticalSpace + imgEndSize));
  }

  double? gameLeftMargin(int index) {
    return lerp(index * (horizontalSpace + imgStartSize), 0);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: lerp(120, maxHeight),
            child: GestureDetector(
              onTap: toggle,
              onVerticalDragEnd: verticalDragEnd,
              onVerticalDragUpdate: verticalDragUpdate,
              child: Container(
                decoration: BoxDecoration(
                  //border: Border(top:BorderSide(color: Colors.white,width: 2)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(18),
                    topRight: Radius.circular(18),
                  ),
                  border: Border.all(
                    width: 0.5,
                    color: Colors.white,
                  ),
                  color: kPrimaryColor,
                ),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Stack(
                  children: [
                    Positioned(
                      left: 0,
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Icon(
                            _controller.status == AnimationStatus.completed
                                ? Icons.keyboard_arrow_down_rounded
                                : Icons.keyboard_arrow_up_rounded,
                            color: Colors.white,
                            size: lerp(24, 22)),
                      ),
                    ),
                    Positioned(
                      left: 0,
                      right: 0,
                      top: lerp(80, 30),
                      child: FadeTransition(
                        opacity: _controller,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Library',
                              style: TextStyle(
                                  color: Color(0xffffffff),
                                  fontSize: lerp(19, 22),
                                  fontWeight: FontWeight.w800),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    toggle();
                                  },
                                  icon: Icon(
                                    Icons.color_lens,
                                    size: lerp(19, 22),
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(width: 20),
                                Icon(
                                  Icons.menu,
                                  color: Colors.white,
                                  size: lerp(19, 22),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    AnimatedPositioned(
                        duration: Duration(milliseconds: 600),
                        curve: Curves.bounceInOut,
                        top: _controller.status == AnimationStatus.completed
                            ? 80
                            : 30,
                        bottom: 0,
                        left: 0,
                        right: 0,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          physics: BouncingScrollPhysics(
                              parent: AlwaysScrollableScrollPhysics()),
                          child: Container(
                            height: (imgEndSize + verticalSpace) * games.length,
                            width:
                                (imgStartSize + horizontalSpace) * games.length,
                            child: GridView.builder(
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: 4, mainAxisSpacing: 40),
                              scrollDirection: Axis.vertical,
                              itemCount: games.length,
                              itemBuilder: (BuildContext context, int index) =>
                                  Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    height: 65,
                                    width: 65,
                                    decoration: BoxDecoration(
                                        color: Colors.red,
                                        image: DecorationImage(
                                            image:
                                                AssetImage(games[index].image),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(30))),
                                  ),
                                  AnimatedOpacity(
                                      duration: Duration(milliseconds: 600),
                                      curve: Curves.bounceInOut,
                                      opacity: _controller.status ==
                                              AnimationStatus.completed
                                          ? 1
                                          : 0,
                                      child: SizedBox(width: 20)),
                                  AnimatedOpacity(
                                    duration: Duration(milliseconds: 600),
                                    curve: Curves.bounceInOut,
                                    opacity: _controller.status ==
                                            AnimationStatus.completed
                                        ? 1
                                        : 0,
                                    child: Text(
                                      games[index].title,
                                      textAlign: TextAlign.center,
                                      maxLines: 1,
                                      overflow: TextOverflow.fade,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )),
                  ],
                ),
              ),
            ));
      },
    );
  }

///////////////////////////////////////////////////////////////////////////////

}
