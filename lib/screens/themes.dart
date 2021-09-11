import 'package:calculator/screens/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/components/constants.dart';

class Themes extends StatefulWidget {

  @override
  _ThemesState createState() => _ThemesState();
}

class _ThemesState extends State<Themes> {
  onThemePressed(String num){
    setState(() {
      if(num == '1'){
        background = Color(0xFF2F3740);
        cContainerColor = Color(0xFF8585A0);
        cTextColor = Colors.white;
        halfNPercentContainerColor = Color(0xFF8585A0);
        halfNPercentTextColor = Colors.white;
        operatorsContainerColor = Color(0xFF8585A0);
        equalToContainerColor = Color(0xFFE0660B);
        numbersContainerColor = Color(0xFFD7D3D2);
        displayTextColor = Color(0xFFEEEDF3);
        numberTextColor = Colors.white;
        buttonTextColor = Color(0xFFD7D3D2);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if(num == '2'){
         cContainerColor = Color(0xFFFCACC9);
         cTextColor = Colors.white;
         halfNPercentContainerColor = Color(0xFFFCACC9);
         halfNPercentTextColor = Colors.white;
         operatorsContainerColor = Color(0xFFFCACC9);
         numbersContainerColor = Color(0xFFC5F3F1);
         equalToContainerColor = Color(0xFFF9D617);
         background = Color(0xFF2F3740);
         numberTextColor = Colors.white;
         buttonTextColor = Color(0xFFEEEDF3);
         displayTextColor = Colors.white;
         Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if(num == '3'){
        cContainerColor = Color(0xFFFCACC9);
        cTextColor = Color(0xFF5C6266);
        halfNPercentContainerColor = Color(0xFFFCACC9);
        halfNPercentTextColor = Color(0xFF5C6266);
        operatorsContainerColor = Color(0xFFFCACC9);
        numbersContainerColor = Color(0xFFC5F3F1);
        numberTextColor = Color(0xFF5C6266);
        equalToContainerColor = Color(0xFFF9D617);
        background = Color(0xFFEEEDF0);
        buttonTextColor = Color(0xFF5C6266);
        displayTextColor = Color(0xFF5C6266);
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if(num == '4'){
        cContainerColor = Color(0xFFEA2946);
        cTextColor = Colors.white;
        halfNPercentContainerColor = Color(0xFF458DF3);
        halfNPercentTextColor = Colors.white;
        operatorsContainerColor = Color(0xFF377F79);
        numbersContainerColor = Color(0xFFEEEDF2);
        numberTextColor = Color(0xFF7A8CAF);
        equalToContainerColor = Color(0xFFF9D617);
        background = Color(0xFF2F3740);
        buttonTextColor = Colors.white;
        displayTextColor = Colors.white;
        // buttonTextColor = Colors.white;
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if(num == '5'){
        cContainerColor = Color(0xFFEA2946);
        cTextColor = Colors.white;
        halfNPercentContainerColor = Color(0xFF458DF3);
        halfNPercentTextColor = Colors.white;
        operatorsContainerColor = Color(0xFF377F79);
        numbersContainerColor = Color(0xFF8A6E48);
        numberTextColor = Color(0xFF7A8CAF);
        equalToContainerColor = Color(0xFFF9D617);
        background = Color(0xFFEEEDF0);
        displayTextColor = Color(0xFF46595C);
        buttonTextColor = Colors.white;
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
      } else if(num == '6'){
        cContainerColor = Color(0xFFEA2946);
        cTextColor = Colors.white;
        halfNPercentContainerColor = Color(0xFF458DF3);
        halfNPercentTextColor = Colors.white;
        operatorsContainerColor = Color(0xFF377F79);
        numbersContainerColor = Color(0xFFEEEDF0);
        numberTextColor = Color(0xFF7A8CAF);
        equalToContainerColor = Color(0xFFF9D617);
        background = Color(0xFFEEEDF0);
        displayTextColor = Color(0xFF46595C);
        buttonTextColor = Colors.white;
        Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));

      }
    });
  }

  Widget images(String num){
    return TextButton(
      onPressed: () {
          onThemePressed(num);
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20)
        ),
        height: MediaQuery.of(context).size.aspectRatio*500,
        width: MediaQuery.of(context).size.aspectRatio*315,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image(
            image: AssetImage('assets/theme$num.png'),

          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Select theme'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                images('6'),
                images('4'),
              ],
            ),
            Row(
              children: [
                images('1'),
                images('3'),
              ],
            ),
            Row(
              children: [
                images('5'),
                images('2'),
              ],
            )
          ],
        ),
      ),
    );
  }
}
