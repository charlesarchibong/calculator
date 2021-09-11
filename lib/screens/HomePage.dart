import 'package:calculator/screens/scientificCalculator.dart';
import 'package:calculator/screens/settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:calculator/components/constants.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String input = '0';
  late String display= '';
  late String expression = '';
  late double intDisplay;
  late double ans;


  buttonPressedRectangleInput(String info,){
    if(info == 'C'){
      input = '0';
      display = '';
    } else if(info =='1/2'){
      input = display + ' ÷ '+ '2';
      intDisplay = double.parse(display);
      ans = intDisplay * 0.5;
      display = ans.toStringAsFixed(5);
      history.add(input + ' = ' + display);
    } else if(info == '%'){
      input = input + ' % ';
      intDisplay = double.parse(display);
      ans = intDisplay * 0.01;
      display = ans.toString();
      history.add(input + ' = ' + display);
    } else if(info == '.'){
      input = input + info;
    }
    else {
      if(input == '0'){
          input = info;
          display = '';
      }else {
        input = input + info;
        display ='';
      }
      }
    }
  Widget rButton(String info, int flex, Color containerColor, Color textColor) {
    return Expanded(
      flex: flex,
      child: GestureDetector(
        onTap: () {
          setState(() {
            buttonPressedRectangleInput(info,);
          });
        },
        child: Container(
          child: Center(
              child: Text(
                info,
                style: TextStyle(
                  fontSize: MediaQuery.of(context).size.width*0.1,
                  fontFamily: 'ZCOOLKuaiLe',
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
              )),
          decoration: BoxDecoration(
              color: containerColor, borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
        ),
      ),
    );
  }
  buttonPressedCircleInput(IconData icon,){
    if(icon == FontAwesomeIcons.divide){
      input = input + '÷';
      display ='';
    } else if( icon == FontAwesomeIcons.times){
      input = input + '×';
      display ='';
    } else if( icon == FontAwesomeIcons.minus){
      input = input + '-';
      display ='';
    } else if(icon == FontAwesomeIcons.plus){
      input = input + '+';
      display ='';
    } else if(icon == FontAwesomeIcons.equals){


      expression = input;
      expression = expression.replaceAll('×', '*');
      expression = expression.replaceAll('÷', '/');
      try{
        Parser p = new Parser();
        Expression exp = p.parse(expression);
        ContextModel cm = ContextModel();
        display = '${exp.evaluate(EvaluationType.REAL, cm)}';
      }catch(e){
        display = 'ERROR';
      }
      history.add(input+' '+'='+' '+ display);
      print(history);


    }
  }
  Widget cButton(IconData icon, Color color,BoxShape shape) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
         setState(() {
           buttonPressedCircleInput(icon);
         });
        },
        child: Container(
          child: Icon(
            icon,
            size: 40,
            color: buttonTextColor,
          ),
          decoration: BoxDecoration(
            color: color,
            shape: shape,
          ),
        ),
      ),
    );
  }
  onIconPressed(IconData icon){
    if(icon == Icons.refresh){
      input ='0';
      display = '';
      history = [];
      print(history);
    } else if( icon == FontAwesomeIcons.calculator) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => ScientificCalculator()));
    } else if(icon == Icons.backspace_outlined){
      display = '';
      if(input.length == 1){
        input = '0';
      } else {
        input = input.substring(0, input.length -1);
      }
    }
  }
  Widget iconMenus(IconData icon, int size) {
    return TextButton(
      onPressed:(){
        setState(() {
         onIconPressed(icon);
        });
        // onIconPressed();
      },child: Icon(icon,
      size: MediaQuery.of(context).size.aspectRatio*size, color: Color(0xFF46595C),),
    );
  }
  List<String> history=[];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: background,
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              flex: 2,
              child: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(input, style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.09,
                        fontFamily: 'Calculator',
                        color: displayTextColor,
                        fontWeight: FontWeight.bold,
                      ),),
                      Text(display, style: TextStyle(
                        fontSize: MediaQuery.of(context).size.width*0.15,
                        fontFamily: 'Calculator',
                        color: displayTextColor,
                        fontWeight: FontWeight.bold,
                      ),),

                    ],
                  ),
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: background,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: Offset(0, 3),
                      )
                    ]),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                iconMenus(Icons.refresh , 95,),
                iconMenus(FontAwesomeIcons.calculator ,73,),
                TextButton(
                  onPressed:(){
                    setState(() {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Settings(history: history),),
                      );
                    });
                    // onIconPressed();
                  },child: Icon(Icons.settings,
                  size: MediaQuery.of(context).size.aspectRatio*95, color: Color(0xFF46595C),),
                ),
                iconMenus(Icons.backspace_outlined,95,),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('C',1, cContainerColor, cTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('1/2', 1,halfNPercentContainerColor, halfNPercentTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('%', 1,halfNPercentContainerColor, halfNPercentTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.divide, operatorsContainerColor, BoxShape.circle),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('7', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('8', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('9', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.times, operatorsContainerColor,BoxShape.circle),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('4', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('5', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('6', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.minus, operatorsContainerColor,BoxShape.circle),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('1', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('2', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('3', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.plus, operatorsContainerColor,BoxShape.circle),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('0', 2,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('.', 1,numbersContainerColor, numberTextColor),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.equals, equalToContainerColor,BoxShape.circle),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),);
  }
}





