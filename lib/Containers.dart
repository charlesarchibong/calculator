import 'package:flutter/material.dart';

class Containers extends StatelessWidget {
  final Color color;

  Containers({required this.color, });
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );
  }
}
