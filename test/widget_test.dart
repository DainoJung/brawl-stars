// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:medicine_reminder/main.dart';

void main() {
  testWidgets('Home page displays user greeting', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MedicineReminderApp());

    // Verify that home page displays greeting.
    expect(find.text('👋 안녕하세요, 김할머니님'), findsOneWidget);

    // Verify that medicine count is displayed.
    expect(find.text('오늘 복용해야 할 약이 2개 있습니다'), findsOneWidget);

    // Verify that quick action cards are present.
    expect(find.text('약 추가하기'), findsOneWidget);
    expect(find.text('챗봇으로 질문하기'), findsOneWidget);
  });

  testWidgets('Bottom navigation bar has 4 items', (WidgetTester tester) async {
    await tester.pumpWidget(const MedicineReminderApp());

    // Verify bottom navigation items
    expect(find.text('홈'), findsOneWidget);
    expect(find.text('약 관리'), findsOneWidget);
    expect(find.text('알람'), findsOneWidget);
    expect(find.text('챗봇'), findsOneWidget);
  });
}
