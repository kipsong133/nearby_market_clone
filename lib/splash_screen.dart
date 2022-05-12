import 'package:extended_image/extended_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: Column(children: [
          // Image.asset('assets/images/lemon.png'),
          ExtendedImage.asset('assets/images/lemon.png'),
          Center(
              child: CircularProgressIndicator(
                color: Colors.red,
              )),
        ]),
      ),
    );
  }
}