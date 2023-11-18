
import 'package:flutter/material.dart';

class BackgroundContainer extends StatelessWidget {

  final Widget child;
  BackgroundContainer({@required this.child});

  @override
  Widget build(BuildContext context) => Container(
    decoration: BoxDecoration(
      // image: DecorationImage(
      //   image: AssetImage('assets/images/borderlessbackground.png'),
      //   fit: BoxFit.cover,
      // )
    ),
    child: SafeArea(child: child),
  );
}