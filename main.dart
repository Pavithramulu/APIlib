import 'package:api/ActivityAPI.dart';
import 'package:api/screen.dart';
import 'package:api/travell.dart';
import 'package:flutter/material.dart';

import 'Activity2.dart';
import 'Autogenerated.dart';
import 'Details API.dart';
import 'Example.dart';
import 'Example1.dart';
import 'Generated.dart';
import 'Models/2.dart';
import 'NationAPI.dart';
import 'SWcompany.dart';
import 'api.dart';
import 'listAPI.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: //softWare(),
       NationAPI(),
      // EmpDetailsAPI(),

      // UserAPI(),
      // softWare1(),
      // Message(),
      //mpDetails(),
      //Abcd1(),
      //Abcd(),
      //New1(),
      //Screen(),
    );
  }
}

