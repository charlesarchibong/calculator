import 'package:calculator/Calculation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late String input = '0';
  late String display= '0';

  Widget rButton(String info, int flex, Color color,) {
    return Expanded(
      flex: flex,
      child: TextButton(
        onPressed: () {
            setState(() {
              Calculation calculate = Calculation(input: input, display: display);
              calculate.buttonPressedRectangleInput(info, input, display);
            });
        },
        child: Container(
          child: Center(
              child: Text(
                info,
                style: TextStyle(
              fontSize: MediaQuery.of(context).size.width*0.1,
            fontFamily: 'ZCOOLKuaiLe',
            color: Color(0xFF46595C),
            fontWeight: FontWeight.bold,
          ),
              )),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(10), shape: BoxShape.rectangle),
        ),
      ),
    );
  }
  Widget cButton(IconData icon, Color color,BoxShape shape) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
         setState(() {
           Calculation circle = Calculation(input: input, display: display);
           input = circle.buttonPressedCircleInput(icon, input);

         });
        },
        child: Container(
          child: Icon(
            icon,
            size: 50,
            color: Color(0xFF46595C),
          ),
          decoration: BoxDecoration(
            color: color,
            shape: shape,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Color(0xFFEEEDF0),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(input, style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.09,
                      fontFamily: 'Calculator',
                      color: Color(0xFF46595C),
                      fontWeight: FontWeight.bold,
                    ),),
                    Text(display, style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width*0.15,
                      fontFamily: 'Calculator',
                      color: Color(0xFF46595C),
                      fontWeight: FontWeight.bold,
                    ),),

                  ],
                ),
                height: 100,
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Color(0xFFEEEDF0),
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
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
              children: [
                SizedBox(
                  width: 10,
                ),
                Icon(Icons.refresh, size: MediaQuery.of(context).size.aspectRatio*75,),
                Icon(Icons.calculate_rounded, size: MediaQuery.of(context).size.aspectRatio*75,),
                Icon(Icons.settings, size: MediaQuery.of(context).size.aspectRatio*75,),
                SizedBox(
                  width: MediaQuery.of(context).size.width*0.62,
                ),
                Icon(Icons.cancel, size: MediaQuery.of(context).size.aspectRatio*75,)
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
                  rButton('C',1, Color(0xFFFCACC9),),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('1/2', 1,Color(0xFFFCACC9)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('%', 1,Color(0xFFFCACC9)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.divide, Color(0xFFFCACC9), BoxShape.circle),
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
                  rButton('7', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('8', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('9', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.times, Color(0xFFFCACC9),BoxShape.circle),
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
                  rButton('4', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('5', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('6', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.minus, Color(0xFFFCACC9),BoxShape.circle),
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
                  rButton('1', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('2', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('3', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.plus, Color(0xFFFCACC9),BoxShape.circle),
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
                  rButton('0', 2,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  rButton('.', 1,Color(0xFFC5F3F1)),
                  SizedBox(
                    width: 10,
                    height: 10,
                  ),
                  cButton(FontAwesomeIcons.equals, Color(0xFFF9D617),BoxShape.circle),
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

