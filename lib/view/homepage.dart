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
  int ? index;
  @override
  void initState() {
    // initData(index!);
    super.initState();
  }
  final TextEditingController addConttroller = TextEditingController();
  Future<void> initData(int index) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List listData = [];
    var getData = pref.getString("todo");
    if (getData != null) {
      listData = jsonDecode(getData);
    }
    addConttroller.text = listData[index]['note'];
  }

  void createData () async {
    if (addConttroller.text.isEmpty) return;
    SharedPreferences prefer = await SharedPreferences.getInstance();
    List listData = [];
    var data = prefer.getString("todo");
    if (data != null) {
      listData = jsonDecode(data);
    }
    Map mapData = {"note":addConttroller.text };
    listData.add(mapData);
    await prefer.setString("todo", jsonEncode(listData));
    // if(addConttroller.text.isNotEmpty){
    //   setState(() {
    //     todos.add(addConttroller.text.trim());
    //   });
    // }

    // setState(() {
    //   addConttroller.clear();
    // });
  }

  void updateData(int index) async {
    SharedPreferences prefe = await SharedPreferences.getInstance();
    List listData = [];
    var getData = prefe.getString("todo");
    if (getData != null) {
      listData = jsonDecode(getData);
    }
    var update = {"note": addConttroller.text};
    listData[index] = update;
    prefe.setString("todo", jsonEncode(listData));
  }

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
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 20,
                        child: Text("${index + 1}"),
                      ),
                      title: Text(listData[index]),
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
