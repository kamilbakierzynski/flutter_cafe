import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class PointsCard extends StatelessWidget {
  int points;
  String name;

  PointsCard({this.points, this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                name + ',',
                style: TextStyle(
                    color: Color(0xFF00704A),
                    fontSize: 40.0,
                    fontWeight: FontWeight.w900),
              ),
              points >= 10
                  ? Container(
                      width: MediaQuery.of(context).size.width - 200,
                      child: AutoSizeText(
                        'czeka na Ciebie darmowa kawa!',
                        maxLines: 2,
                        style: TextStyle(
                            color: Color(0xFF00704A),
                            fontWeight: FontWeight.w500,
                            fontSize: 17.0),
                      ),
                    )
                  : points == 0
                      ? Text(
                          'gotowy zbierać punkty?',
                          style: TextStyle(
                              color: Color(0xFF00704A),
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        )
                      : Text(
                          'świetnie Ci idzie!',
                          style: TextStyle(
                              color: Color(0xFF00704A),
                              fontWeight: FontWeight.w500,
                              fontSize: 17.0),
                        ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                points.toString(),
                style: TextStyle(color: Color(0xFFC52836), fontSize: 40.0),
              ),
              SizedBox(
                width: 4.0,
              ),
              Icon(
                Icons.favorite,
                color: Color(0xFFC52836),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
