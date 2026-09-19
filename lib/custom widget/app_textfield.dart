import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  const AppTextField({
    super.key,
    required this.controller,  this.hText, this.onTab, this.lText,
  });

  final TextEditingController controller;
  final String ?hText;
  final VoidCallback ? onTab;
  final String ?lText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTab,
      controller: controller,
      style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.bold
      ),
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          hintText: hText,
          labelStyle: TextStyle(
              fontSize: 13,fontWeight: FontWeight.bold
          ),
          labelText: lText,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide:BorderSide(color: Colors.grey)
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 1,color: Colors.black),
            borderRadius: BorderRadius.circular(10),
          )
      ),
    );
  }
}

