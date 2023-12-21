import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:poc_mvvm/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('end-to-end', () {
    testWidgets('Loading data and render Card List', (tester) async {
      //Pump MyApp() widget to tester
      await tester.pumpWidget(const MyApp());

      //Find Text
      final text = find.text('Open Application !!!');

      //Assert - Check that text widget is present
      expect(text, findsOneWidget);

      //await render content
      await tester.pumpAndSettle(const Duration(seconds: 1));

      //Find widget type Card
      final card = find.byType(Card);

      //Assert - Check Card widgets are present
      expect(card, findsAny);
    });
  });
}
