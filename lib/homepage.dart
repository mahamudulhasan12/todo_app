import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app/settings.dart';




class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List todos=[];
  
  final TextEditingController controller = TextEditingController();
  
  


    void addTodo() {       // add funcation decleartion
    if (controller.text.trim().isNotEmpty) {
      setState(() {
        todos.add(controller.text.trim());
      });
      controller.clear();
    }
  }

  void removeToDo(int index){  // remove funcation decleration
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
              controller: controller,
              decoration: InputDecoration(
                hintText: "Enter ToDo Task",
                border: OutlineInputBorder(),
                suffixIcon: IconButton(onPressed: addTodo, icon: Icon(Icons.add)),
                
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
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
            accountName: Text("Mahamdul"),
            accountEmail: Text("mahamudulislam459@gmail.com"),
            currentAccountPicture: CircleAvatar(
              radius: 15,
              backgroundColor: Colors.black,
              child: Icon(Icons.person,size: 20,),
            ),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            
          
          ),
          ListTile(
            title: Text("Home"),
            leading: Icon(Icons.home),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage()));
            },
          ),
          ListTile(
            title: Text("Setting"),
            leading: Icon(Icons.settings),
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>Settings()));
              
            },
          ),
          SizedBox(
            height: 5,
          ),
          ListTile(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.exit_to_app),
                SizedBox(
                  width: 10,
                ),
                Text("Exit"),
                
              ],
            ),
            onTap: (){
              
              showDialog(
                context: context,
                builder: (context) =>AlertDialog(
                  title: Text("Exit App"),
                  content: Text("Are you sure you want to exit ?"),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child:Text("No") ,
                      
                    ),
                    TextButton(
                      onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Homepage())),
                      child: Text("Yes",style: TextStyle(
                        color: Colors.red,
                      ),),
                    )
                  ],
                )
              );
            },
            
          )
          

          ],
          
        ),
      ),
      
      
    );
  }
}