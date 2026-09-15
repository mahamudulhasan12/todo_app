


import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:todo_app/view/settings.dart';
import 'package:todo_app/view/widget/app_drawer.dart';




class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todos=[];
  
  final TextEditingController addConttroller = TextEditingController();




void addToDo() async{
  if(addConttroller.text.isEmpty) return;
  if(addConttroller.text.isNotEmpty){
    setState(() {
      todos.add(addConttroller.text.trim());
    });
  }

  setState(() {
    addConttroller.clear();
  });
}


  void removeToDo(int index){
  setState(() {
    todos.removeAt(index);
  });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 105, 161, 148),
        title: Text("ToDo App",style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color:Colors.black,
          letterSpacing: 2,
        ),),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: (){
              Get.changeThemeMode(
                Get.isDarkMode ? ThemeMode.light :ThemeMode.dark,
              );
            },
            icon: Icon(
              Get.isDarkMode ? Icons.light_mode : Icons.dark_mode,size: 30,
            ),
          )
        ],
      ),
      
      body:Padding(
        padding: EdgeInsets.all(10),
        
        child: Column(
          
          children: [
            
            TextField(
              controller: addConttroller,
              decoration: InputDecoration(
                hintText: "Enter ToDo Task",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: addToDo, icon: Icon(Icons.add)),
                
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {

                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.grey[300],
                        radius: 20,
                        child: Text("${index +1}"),
                        
                      ),
                      title: Text(todos[index]),
                      trailing: IconButton(
                        onPressed: ()=>removeToDo(index),
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

