import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Calculation {
  String input;
  String display;
  Calculation({required this.input, required this.display});

  getZero(String input, String display){
  return input = '0';
  }



  buttonPressedRectangleInput(String info,String input, String display){
    if(info == 'C'){
      return input = '0';
    } else if(info =='1/2'){
      print('info');
    } else if(info == '%'){
      print('info');
    } else {
      if(input == '0') {
        return '' + info;
      } else {
        return input = input + info;
      }
    }
  }

  buttonPressedCircleInput(IconData icon,){
    if(icon == FontAwesomeIcons.divide){
      input = input + '÷';
    } else if( icon == FontAwesomeIcons.times){
      return input = input + '×';
    } else if( icon == FontAwesomeIcons.minus){
      return input = input + '-';
    } else if(icon == FontAwesomeIcons.plus){
      return input = input + '+';
    }
  }

  onIconPressed(IconData icon, String display){
    if(icon == Icons.refresh){

    } else if( icon == FontAwesomeIcons.calculator){

    } else if( icon == Icons.settings){

    } else if(icon == Icons.cancel){
      return display = '0';
    }
  }

  buttonPressedCircleDisplay(IconData icon, String display){
    if(icon == FontAwesomeIcons.equals)
      return display = 'ANS';
  }
}