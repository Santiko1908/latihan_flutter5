import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:latihan_flutter5/main.dart';

void main() {
  testWidgets('menampilkan contoh aturan layout', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: LayoutRulesExample()));

    expect(find.text('Tiga Aturan Layout Flutter'), findsOneWidget);
    expect(
      find.text('1 & 2. Aturan Constraints (Batas) dan Size (Ukuran)'),
      findsOneWidget,
    );
    expect(find.text('3. Aturan Posisi (dengan Align)'), findsOneWidget);
    expect(
      tester.getSize(find.byKey(const ValueKey('constraint-example'))),
      const Size(200, 100),
    );

    final parentTopLeft = tester.getTopLeft(
      find.byKey(const ValueKey('alignment-parent')),
    );
    final childTopLeft = tester.getTopLeft(
      find.byKey(const ValueKey('alignment-child')),
    );
    expect(childTopLeft - parentTopLeft, const Offset(120, 120));
  });
}
