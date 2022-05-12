import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:nearby_market_clone/router/locations.dart';
import 'package:nearby_market_clone/screens/splash_screen.dart';
import 'package:nearby_market_clone/utils/logger.dart';

final _routerDelegate = BeamerDelegate(locationBuilder: BeamerLocationBuilder(beamLocations: [HomeLocation()]));

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // 'future' 파라미터에서 네트워크 통신과 같은 동작을 하게 됩니다.
        future: Future.delayed(Duration(seconds: 3), () => 100),
        builder: (context, snapshot) {
          return AnimatedSwitcher(
            duration: Duration(seconds: 3),
            child: _splashLoadingWidget(snapshot),
          );
        });
  }

  StatelessWidget _splashLoadingWidget(AsyncSnapshot<Object?> snapshot) {
    if (snapshot.hasError) {
      // 1 에러가 발생한 케이스
      print('ERROR 발생~!');
      return Text('ERROR 발생');
    } else if (snapshot.hasData) {
      // 2 로딩이 끝나서 정상적인 케이스
      return LemonApp();
    } else {
      // 3 로딩중인 케이스
      return SplashScreen();
    }
  }
}

class LemonApp extends StatelessWidget {
  const LemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: BeamerParser(),
      routerDelegate: _routerDelegate,);
  }
}
