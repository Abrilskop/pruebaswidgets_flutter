import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaswidgets_flutter/main.dart';

void main() {
  testWidgets('Verifica incremento y decremento del contador', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    // Encuentra el botón de incremento
    final incrementBtn = find.byKey(const Key('incrementBtn'));
    final decrementBtn = find.byKey(const Key('decrementBtn'));
    final counterText = find.byKey(const Key('counterText'));

    // Verifica que el valor inicial sea 0
    expect(find.text('Contador: 0'), findsOneWidget);

    // Incrementa y verifica
    await tester.tap(incrementBtn);
    await tester.pump();
    expect(find.text('Contador: 1'), findsOneWidget);

    // Decrementa y verifica
    await tester.tap(decrementBtn);
    await tester.pump();
    expect(find.text('Contador: 0'), findsOneWidget);
  });

  testWidgets('Verifica que no navega si el nombre está vacío', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final navigateBtn = find.byKey(const Key('navigateBtn'));
    await tester.tap(navigateBtn);
    await tester.pumpAndSettle();

    // Asegúrate de que aún estamos en CounterPage
    expect(find.byType(TextField), findsOneWidget);
    expect(find.textContaining('Hola'), findsNothing);
  });

  testWidgets('Verifica que el botón reset funciona', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final incrementBtn = find.byKey(const Key('incrementBtn'));
    final resetBtn = find.byKey(const Key('resetBtn'));

    await tester.tap(incrementBtn);
    await tester.pump();
    expect(find.text('Contador: 1'), findsOneWidget);

    await tester.tap(resetBtn);
    await tester.pump();
    expect(find.text('Contador: 0'), findsOneWidget);
  });
}
