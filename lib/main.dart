import 'package:flutter/material.dart';
import 'package:test_peto/pages/menu_sidebar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        home: MenuDashboardPage());
  }
}