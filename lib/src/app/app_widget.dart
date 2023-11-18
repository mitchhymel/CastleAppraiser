
import 'package:btcc/src/screens/main_screen.dart';
import 'package:flutter/material.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Btcc',
    home: MainScreen(),
    themeMode: ThemeMode.light,
    theme: ThemeData.dark().copyWith(
      accentColor: Colors.blueAccent,
      textTheme: TextTheme(
        
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),

    )
  ); 
}
