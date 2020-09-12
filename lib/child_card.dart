import 'package:flutter/material.dart';
import 'constants.dart';

class CardChild extends StatelessWidget {
  CardChild({this.gender,this.figure});
  final String gender;
  final  IconData figure;


  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          figure,
          size: 80,
        ),
        SizedBox(height: 15.0),
        Text(gender,style: klabelTextStyle,
        ),
      ],

    );
  }
}

