import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_app/view/widget/app_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List listData = [];
  // int ? index;
  @override
  void initState() {
    // initData(index!);
    lodData();
    super.initState();
  }

  final TextEditingController addConttroller = TextEditingController();
  // Future<void> initData(int index) async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   List listData = [];
  //   var getData = pref.getString("todo");
  //   if (getData != null) {
  //     listData = jsonDecode(getData);
  //   }
  //   addConttroller.text = listData[index]['note'];
  // }

  Future<void> lodData()async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String ? getData =pref.getString("todo");
    if(getData !=null){
      setState(() {
        listData = jsonDecode(getData);
      });
    }
  }

  void createData()async{
    String text = addConttroller.text.trim();
    if(text.isEmpty) return;

    SharedPreferences prefe = await SharedPreferences.getInstance();

    String? getData = await prefe.getString("todo");
    // if(getData != null){
    //
    //
    // }
    Map mapData = {"notes" :text};
    setState(() {
      listData.add(mapData);
    });
    await prefe.setString("todo", jsonEncode(listData));
    addConttroller.clear();
  }
  // void updateData(int index) async {
  //   SharedPreferences prefe = await SharedPreferences.getInstance();
  //   List listData = [];
  //   var getData = prefe.getString("todo");
  //   if (getData != null) {
  //     listData = jsonDecode(getData);
  //   }
  //
  //   setState(() {
  //     var update = {"note": addConttroller.text};
  //     listData[index] = update;
  //   });
  //   prefe.setString("todo", jsonEncode(listData));
  // }

  void removeToDo(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    setState(() {
      listData.removeAt(index);
    });
    await pref.setString("todo", jsonEncode(listData));
  }
  // void saveData()async{
  //   await Future.delayed(Duration(seconds: 1));
  //   if(index >=0){
  //
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 161, 148),
        title: Text(
          "ToDo App",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            letterSpacing: 2,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light : ThemeMode.dark,
              );
            },
            icon: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,
              size: 30,
            ),
          ),
        ],
      ),

      body: Padding(
        padding: EdgeInsets.all(10),

        child: Column(
          children: [
            TextField(
              controller: addConttroller,
              decoration: InputDecoration(
                hintText: "Enter ToDo Task",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(
                  onPressed: (){
                    createData();
                  },
                  icon: Icon(Icons.add),
                ),
              ),
            ),
            SizedBox(height: 50),
            Expanded(
              child: ListView.builder(

                itemCount: listData.length,
                itemBuilder: (context, index) {
                  var item = listData[index];

                  // টাইপ সেফটি চেক
                  String noteText = "";
                  if (item is Map) {
                    noteText = item['note'] ?? item['notes'] ?? '';
                  } else if (item is String) {
                    noteText = item;
                  }
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 20,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(noteText),
                      trailing: IconButton(
                        onPressed: () => removeToDo(index),
                        icon: Icon(Icons.delete),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),

      drawer: AppDrawer(),
    );
  }
}
