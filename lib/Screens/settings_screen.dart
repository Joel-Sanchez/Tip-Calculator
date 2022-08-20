import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatefulWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _SettingState();
}

class _SettingState extends State<Settings> {
  final controllerPercent = TextEditingController();

  void setDefaultValues(double value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('percent', value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 215, 244, 97),
      appBar: AppBar(
        title: const Text('Settings'),
        elevation: 3,
        backgroundColor: Color.fromARGB(255, 221, 248, 111),
      ),
      body: Center(
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            child: TextFormField(
              controller: controllerPercent,
              decoration: const InputDecoration(
                  labelText: "Predetermine Percent",
                  border: UnderlineInputBorder()),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  double percent = double.parse(controllerPercent.text);
                  setDefaultValues(percent);
                });
                Navigator.pop(context);
              },
              child: const Text("Save"))
        ]),
      ),
    );
  }
}
