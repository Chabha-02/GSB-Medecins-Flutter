import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget bg;

  const Background({
    Key? key,
    required this.bg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set up full w/h of our screen
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: double.infinity,
      child: Stack(
        // Placing image in the middle of the screen
        alignment: Alignment.center,
        children: <Widget>[


          bg,
        ],
      ),
    );
  }
}