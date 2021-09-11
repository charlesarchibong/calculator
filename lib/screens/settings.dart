import 'package:calculator/screens/history.dart';
import 'package:calculator/screens/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'themes.dart';

class Settings extends StatefulWidget {
late List<String> history;
Settings({required this.history});
  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {

  settingsMenuPressed(IconData icon){
    if(icon == Icons.history){
      Navigator.push(context, MaterialPageRoute(builder: (context) => History(history: widget.history)));
    }else if(icon == Icons.delete){
      widget.history = [];
    } else if(icon == Icons.color_lens){
      Navigator.push(context, MaterialPageRoute(builder: (context) => Themes()));
    } else if(icon == Icons.format_size){

    }
  }

  Widget settingsMenu(IconData icon, String info){
    return TextButton(
      onPressed: (){
        settingsMenuPressed(icon);
      },
      child: ListTile(
        leading: Icon(icon),
        title: Text(info),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: ListView(
          children: [
            settingsMenu(Icons.history, 'View history'),
            settingsMenu(Icons.delete, 'Clear history'),
            settingsMenu(Icons.color_lens, 'Change Theme'),

          ],
        ),
      ),
    );
  }
}
