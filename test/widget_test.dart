// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:nearby_market_clone/main.dart';

void main() {
  testWidgets('Counter increments smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });

  test('Future Tutorial', () {
    Future<String> NowWeather() {
      return Future.delayed(
        Duration(seconds: 1),
        () {
          return '날씨 정보' * 20;
        },
      )
      ;
    }

    void printLunchTime() {
      print('점심시간₩!');
    }

    void printMySalary() => print('10억');

    void printNowWeather() async {
      var weatherData = await NowWeather();
      print(weatherData);
    }

    printNowWeather();
    printLunchTime();
    printMySalary();
  });
}
