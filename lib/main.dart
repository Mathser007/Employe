import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:untitled3/provider.dart';

import 'home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => EmployeeProvider(),
      child: MaterialApp(
        title: 'Employee Directory',
        home: EmployeeListScreen(),
      ),
    );
  }
}