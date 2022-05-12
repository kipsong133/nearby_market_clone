import 'package:flutter/material.dart';
import 'package:nearby_market_clone/splash_screen.dart';

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
          // 1 에러가 발생한 케이스
          // if (snapshot.hasError) {
          //   print('ERROR 발생~!');
          //   return Text('ERROR 발생');
          // }
          //
          // // 2 로딩이 끝나서 정상적인 케이스
          // if (snapshot.hasData) {
          //   return LemonApp();
          // }
          //
          // // 3 로딩중인 케이스
          // return SplashScreen();

          // 내가 만든 코드
          return showWidgetInNetworking(
              snapshot: snapshot,
              onCompleted: LemonApp(),
              onError: Text('ERROR'),
              onLoading: SplashScreen());
        });
  }
}

class LemonApp extends StatelessWidget {
  const LemonApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
    );
  }
}

Widget showWidgetInNetworking({
  required AsyncSnapshot snapshot,
  required Widget onError,
  required Widget onCompleted,
  required Widget onLoading,
}) {
  final currentState = convertSnapshotToState(snapshot: snapshot);

  switch (currentState) {
    case SnapShotState.loading:
      return onLoading;
    case SnapShotState.complete:
      return onCompleted;
    case SnapShotState.error:
      return onError;
    default:
      return onLoading;
  }

  return Text('test');
}

SnapShotState convertSnapshotToState({required AsyncSnapshot snapshot}) {
  if (snapshot.hasError) {
    return SnapShotState.error;
  }

  if (snapshot.hasData) {
    return SnapShotState.complete;
  }

  return SnapShotState.loading;
}

enum SnapShotState { error, complete, loading }

// extension SnapShotStateExtension on SnapShotState {
//   String get state {
//     switch (this) {
//       case PreferencesKey.favorites:
//         return 'favorites';
//       default:
//         return '';
//     }
//   }
// }
