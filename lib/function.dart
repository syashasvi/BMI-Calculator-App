
import 'dart:math';

class CalculateBMI{
  CalculateBMI({this.height , this.weight});

  final int height;
  final int weight;

  double _bmi;
  String calculateBMI(){
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult(){
    if(_bmi>=25){
      return 'OVERWEIGHT';
    }else if(_bmi>18.5){
      return 'NORMAL';
    }else{
      return 'UNDERWEIGHT';
    }
  }

  String getFeedback(){
    if(_bmi>=25){
      return 'You hare Overweight, try EXERCISE more and avoid JUNKIEES!!';
    }else if(_bmi>18.5){
      return 'GOOD JOB!!, Stay the way you are.';
    }else{
      return 'You are Underweight, eat healthy, and gain some mucle mass.';
    }
  }
}