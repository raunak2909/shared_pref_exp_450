import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const String pref_user_name = "user_name";

  SharedPreferences? prefs;
  String name = "";
  int openCount = 1;

  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    initPref();
  }

  initPref() async{
    prefs = await SharedPreferences.getInstance();
    getNameFromPrefs();
    updateAppCount();
  }

  void updateAppCount(){
    openCount = prefs!.getInt("Count") ?? 0;
    openCount++;
    prefs!.setInt("Count", openCount);
    setState(() {

    });
  }

  void getNameFromPrefs() async {
    name = prefs!.getString(pref_user_name) ?? "";
    setState(() {

    });
  }
  Color bgColor = Colors.white;

  @override
  Widget build(BuildContext context) {

    if(openCount%3==0 && openCount%5==0){
      bgColor = Colors.orange.shade200;
    } else if(openCount%5==0){
      bgColor = Colors.blue.shade200;
    } else if(openCount%3==0) {
      bgColor = Colors.green.shade200;
    }

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StatefulBuilder(
          builder: (context, ss) {
            return Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: double.infinity,
                  child: Center(
                    child: Text("$openCount", style: TextStyle(
                      fontSize: 100,
                      color: Colors.black12
                    ),),
                  ),
                ),
                Column(
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
                      name = nameController.text;
                      prefs!.setString(pref_user_name, name);
                      ss((){});
                    }, child: Text('Save'))
                  ],
                ),
              ],
            );
          }
        ),
      ),
    );
  }

}


