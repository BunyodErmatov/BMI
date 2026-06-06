import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:quiz_app_bmi/main.dart';

void main() {
  testWidgets('Quiz App smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const QuizApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
