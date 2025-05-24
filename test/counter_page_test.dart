import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaswidgets_flutter/main.dart';

void main() {
  testWidgets('Contador comienza en 0, incrementa y decrementa', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    expect(find.text('Contador: 0'), findsOneWidget);

    await tester.tap(find.byKey(const Key('incrementBtn')));
    await tester.pump();
    expect(find.text('Contador: 1'), findsOneWidget);

    await tester.tap(find.byKey(const Key('decrementBtn')));
    await tester.pump();
    expect(find.text('Contador: 0'), findsOneWidget);
  });

  testWidgets('Botón reset reinicia el contador a 0', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('incrementBtn')));
    await tester.pump();
    expect(find.text('Contador: 1'), findsOneWidget);

    await tester.tap(find.byKey(const Key('resetBtn')));
    await tester.pump();
    expect(find.text('Contador: 0'), findsOneWidget);
  });

  testWidgets('No navega si el campo de nombre está vacío', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.tap(find.byKey(const Key('navigateBtn')));
    await tester.pumpAndSettle();

    expect(find.byType(TextField), findsOneWidget); // Sigue en CounterPage
    expect(find.textContaining('Hola'), findsNothing);
  });

  testWidgets('Navega a ResultPage con nombre ingresado', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.enterText(find.byKey(const Key('nameField')), 'Luis');
    await tester.tap(find.byKey(const Key('incrementBtn')));
    await tester.pump();
    await tester.tap(find.byKey(const Key('navigateBtn')));
    await tester.pumpAndSettle();

    expect(find.text('Hola Luis, tu contador es 1'), findsOneWidget);
  });
}
