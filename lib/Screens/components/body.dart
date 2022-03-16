import 'package:flutter/material.dart';
import 'package:gsb_medecins/Screens/components/background.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      bg: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.symmetric(vertical: 60),
            child: Image(
              image: const AssetImage('assets/images/GSB-Wel.png'),
              height: size.height * 0.22,
            ),
          ),
          const Text(
            // Text styles
            "Bienvenue sur GSB",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
            ),
          ),
        ],
      ),
    );
  }
}
