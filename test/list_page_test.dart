import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pruebaswidgets_flutter/list_page.dart';

void main() {
  testWidgets('Agregar nueva tarea dinámicamente', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: ListPage()));

    // Escribir nueva tarea
    await tester.enterText(find.byKey(const Key('taskInput')), 'Terminar guía de widgets');

    // Presionar botón de agregar
    await tester.tap(find.byKey(const Key('addTaskBtn')));
    await tester.pump(); // Espera que se actualice la UI

    // Verifica que la nueva tarea aparezca en la lista
    expect(find.text('Terminar guía de widgets'), findsOneWidget);
  });
}
