import 'package:flutter/material.dart';
import 'package:flare_flutter/flare_actor.dart';

class AddPointsAnimation extends StatefulWidget {

  bool showAnim;

  AddPointsAnimation({this.showAnim});

  @override
  _AddPointsAnimationState createState() => _AddPointsAnimationState();
}

class _AddPointsAnimationState extends State<AddPointsAnimation> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              height:
              widget.showAnim ? MediaQuery.of(context).size.height : 0,
              width: MediaQuery.of(context).size.width,
              color: widget.showAnim ? Colors.black87 : Colors.transparent,
              duration: Duration(seconds: 1),
              curve: Curves.fastOutSlowIn,
              child: widget.showAnim
                  ? FlareActor(
                'assets/images/confetti.flr',
                animation: 'boom',
              )
                  : SizedBox.shrink(),
            ),
            widget.showAnim
                ? Container(
              height: widget.showAnim ? 600 : 0,
              width: widget.showAnim ? 600 : 0,
              child: FlareActor(
                'assets/images/successFast.flr',
                animation: 'Untitled',
              ),
            )
                : SizedBox.shrink(),
          ],
        ));
  }
}
