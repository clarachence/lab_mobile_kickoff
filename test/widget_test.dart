import 'package:flutter/material.dart'; // Importação necessária para o FloatingActionButton
import 'package:flutter_test/flutter_test.dart';
import 'package:lab_mobile_kickoff/main.dart' as app;

void main() {
  testWidgets('Verifica se a tela de lista carrega', (WidgetTester tester) async {
    app.main();
    await tester.pumpAndSettle();

    expect(find.text('Laboratório Mobile'), findsOneWidget);
    
    expect(find.byType(FloatingActionButton), findsOneWidget);
  });
}