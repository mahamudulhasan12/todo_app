import 'package:flutter/material.dart';

import '../homepage.dart';
import '../settings.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({
    super.key,
  });

  @override

  Widget build(BuildContext context) {
    return Drawer(
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
    );
  }
}