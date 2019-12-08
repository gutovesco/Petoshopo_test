import 'package:flutter/material.dart';

class Registercustomer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
            return new Scaffold(
           appBar: AppBar(
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                color: Colors.black87,
                onPressed: () => Navigator.pop(context, false),
              ),
            ),
           body: Container(
            padding: EdgeInsets.only(
              top: 5,
              left: 10,
              right: 10,
            ),
            color: Colors.white,
            child: ListView(
              children: <Widget> [
                SizedBox(
                  height: 20,
                ),
              ]
            )));
  }}