import 'package:flutter/material.dart';

class PhoneFiled extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        labelText: 'Phone number',
        hintText: '',
        labelStyle: TextStyle(color: Colors.grey, fontSize: 20),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
            color: Colors.black, // Border color
          ),
        ),
      ),
    );
  }
}

class MyStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 200,
          height: 200,
          color: Colors.blue,
        ),
        Positioned(
          left: 20, // Adjust the left position as needed
          top: -30, // Adjust the top position as needed
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
        ),
      ],
    );
  }
}
