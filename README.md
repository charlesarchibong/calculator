import 'package:flutter/material.dart';
import 'constants.dart';

class Rectangle extends StatelessWidget {
  final info;
  Rectangle({this.info});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: (){},
        child: Container(
          child: Center(child: Text(info,style: kNumberText,)),
          decoration: BoxDecoration(
              color: Color(0xFFC5F3F1),
              borderRadius: BorderRadius.circular(10)
          ),
        ),
      ),
    );
  }
}