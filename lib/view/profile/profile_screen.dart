import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  File ? fileImage;
  Future<void> getImage()async{
    final imagePicker =  ImagePicker();
    final XFile? image =await imagePicker.pickImage(source: ImageSource.gallery);
    if(image != null){
      setState(() {
        fileImage = File(image.path);
        log("$fileImage");
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text("Profle Screen",style: TextStyle(
          fontSize: 20,fontWeight: FontWeight.bold,
        ),),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Center(
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFE8EFFC),
                  ),
                  child: ClipOval(child: fileImage !=null ?Image.file(fileImage!,fit: BoxFit.cover,) : Image.asset("assets/Mahamudul.jpg",fit: BoxFit.cover,)),
                ),
                Positioned(
                  right: -20,
                  bottom: 1,
                  child: IconButton(onPressed: (){
                    getImage();
                  }, icon:Icon(Icons.camera_alt_outlined),),
                )
              ],
            ),
          ),
          SizedBox(height: 10,),
          Text("Use Name"),
        ],
      )
    );
  }
}
