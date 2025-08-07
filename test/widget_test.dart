import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:movies_app/main.dart';

void main() {
  testWidgets('Movies app smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(MoviesApp());
    expect(find.byType(MaterialApp), findsOneWidget);
  });
}
