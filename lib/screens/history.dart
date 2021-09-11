import 'package:flutter/material.dart';

class History extends StatelessWidget {
  late final List<String> history;
  History({required this.history});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [Icon(Icons.history)],
        title: Text('History'),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: history.length,
          itemBuilder: (context, index){
            return Container(
              color: Colors.grey[300],
              child: ListTile(
               title: Text('${history[index]}')
            )
            );
          }
      ),
    );
  }
}
