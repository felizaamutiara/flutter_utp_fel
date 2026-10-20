import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:utp_pinterest/main.dart';

void main() {
  testWidgets('Aplikasi tampil dan navigasi bawah berfungsi',
      (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final nav = find.byType(BottomNavigationBar);
    expect(nav, findsOneWidget);
    expect(find.text('Semua'), findsOneWidget);

    await tester.tap(
      find.descendant(of: nav, matching: find.byIcon(Icons.search)),
    );
    await tester.pump();
    expect(find.byType(TextField), findsOneWidget);

    await tester.tap(
      find.descendant(of: nav, matching: find.byIcon(Icons.person)),
    );
    await tester.pump();
    expect(find.text('Disimpan'), findsOneWidget);
  });
}
