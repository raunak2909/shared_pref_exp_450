import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String pref_user_name = "user_name";

  String name = "";

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getNameFromPrefs();
  }

  getNameFromPrefs() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    name = prefs.getString(pref_user_name) ?? "";
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StatefulBuilder(
          builder: (context, ss) {
            return Column(
              children: [
                name.isNotEmpty ? Text('Welcome, $name', style: TextStyle(fontSize: 21),) : Container(),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: nameController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Enter your name',
                    labelText: "Name"
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                ElevatedButton(onPressed: () async {
                  SharedPreferences prefs = await SharedPreferences.getInstance();
                  name = nameController.text;
                  prefs.setString(pref_user_name, name);
                  ss((){});
                }, child: Text('Save'))
              ],
            );
          }
        ),
      ),
    );
  }
}
