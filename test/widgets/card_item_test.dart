import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:poc_mvvm/widgets/card_item.dart';

void main() {
  testWidgets('CardItem has a title', (tester) async {
    await tester.pumpWidget(const MaterialApp(
        home: Scaffold(
            body: CardItem(
      title: 'Title',
    ))));
    final titleFinder = find.text('Title');
    expect(titleFinder, findsOneWidget);
  });
}
