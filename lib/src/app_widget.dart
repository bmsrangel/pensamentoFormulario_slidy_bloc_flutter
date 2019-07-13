import 'package:flutter/material.dart';
import 'package:pensamentoformulario/src/home/home_module.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primaryColor: Color(0xFF007989), accentColor: Color(0xFF007989)),
      debugShowCheckedModeBanner: false,
      home: HomeModule(),
    );
  }
}
