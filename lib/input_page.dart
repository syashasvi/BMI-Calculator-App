import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'child_card.dart';
import 'Reusable_card.dart';
import 'constants.dart';
import 'result.dart';
import 'function.dart';

enum Gender{
  male, female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectGender;
  int height = 180;
  int weight = 74;
  int age = 19;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                onPress: (){
                  setState(() {
                    selectGender = Gender.male;
                  });
                },
                  colour: selectGender == Gender.male? kactiveColor : kpressedColor,
                cardChild: CardChild(
                  gender:'MALE' ,
                  figure:FontAwesomeIcons.male,
                )
              ),
              ),
              Expanded(child:ReusableCard(
                  onPress: (){
                    setState(() {
                      selectGender = Gender.female;
                    });
                  },
                  colour: selectGender == Gender.female? kactiveColor : kpressedColor,
                  cardChild: CardChild(
                    gender:'FEMALE' ,
                    figure:FontAwesomeIcons.female,
                  )
              ),
              ),
            ],
          ),),
          Expanded(child:ReusableCard(
            colour:kactiveColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('HEIGHT' ,
                style: klabelTextStyle,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  textBaseline: TextBaseline.alphabetic,
                  children: <Widget>[
                    Text(
                      height.toString(),
                      style: knumerstyle,
                    ),
                    Text(
                      'cm',
                      style: klabelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    thumbColor: Color(0xffeb1555),
                    overlayColor: Color(0x15eb1555),
                    thumbShape:
                      RoundSliderThumbShape(enabledThumbRadius: 15.0),
                    overlayShape:
                      RoundSliderOverlayShape(overlayRadius: 30.0),
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120.0,
                    max: 220.0,
                    activeColor: Color(0xffeb1555),
                    inactiveColor: Color(0xff8d8e98),
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.round();
                      });
                    },
                  ),
                ),
              ],
            ),
          ),),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                colour:kactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                    style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                      Text(
                        weight.toString(),
                        style: knumerstyle,
                      )
                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              weight--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              weight++;
                            });
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
              ),
              Expanded(child: ReusableCard(
                colour:kactiveColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'AGE',
                      style: klabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                      Text(
                        age.toString(),
                        style: knumerstyle,
                      ),
                    ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                          icon: FontAwesomeIcons.minus,
                          onPressed: (){
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        SizedBox(width: 10.0),
                        RoundIconButton(
                          icon: FontAwesomeIcons.plus,
                          onPressed: (){
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              ),
            ],
          ),),
          GestureDetector(
            onTap: (){
              CalculateBMI calc = CalculateBMI(height: height , weight: weight);

              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return ResultPage(
                      bmiResult: calc.calculateBMI(),
                      bmi: calc.getResult(),
                      bmiFeedback: calc.getFeedback() ,
                    );
                  })
              );
            },
            child: Container(
              child: Center(
                child: Text('CALCULATE YOUR BMI',style: klabelTextStyle,
                ),
              ),
              padding: EdgeInsets.only(top: 10.0),
              color: kbottomContainerColor,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height:80.0,

            ),
          )
        ],
      )
    );
  }
}


class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon,@required this.onPressed});
  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 6.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,height: 56.0
      ),
      shape: CircleBorder(),
      fillColor:Color(0xff4c4f5e),
      );
  }
}







