import 'package:bmi_calculator/Reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';

class ResultPage extends StatelessWidget {

  ResultPage({@required this.bmiResult,@required this.bmi ,@required this.bmiFeedback });
  final String bmiResult;
  final String bmi;
  final String bmiFeedback;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(30.0),
              child: Text('Your Result',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontSize: 40.0,
                  )
              ),
            ),
          ),
        Expanded(
          flex: 6,
          child: ReusableCard(
            colour: kactiveColor,
            cardChild: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(bmi.toUpperCase(),
                style: ktextStyle),
                Text(bmiResult,
                style: kbmistyle),
                Text(bmiFeedback,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 22.0,
                  fontWeight: FontWeight.bold
                ))
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            Navigator.pop(context);
          },
          child: Container(
            child: Center(
              child: Text('Re-Calculate your BMI',
                style: klabelTextStyle,
              ),
            ),
            padding: EdgeInsets.only(top: 10.0),
            color: kbottomContainerColor,
            margin: EdgeInsets.only(top: 10.0),
            width: double.infinity,
            height:80.0,
          ),

          ),

        ],
      )
    );
  }
}
