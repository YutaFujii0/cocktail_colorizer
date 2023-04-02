import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:cocktail_colorizer/main.dart';

void main() {
  testWidgets('Home page displays welcome message', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(CocktailColorizerApp());

    // Verify that the welcome message is displayed.
    expect(find.text('Welcome to Cocktail Colorizer!'), findsOneWidget);
    expect(find.byType(AppBar), findsOneWidget);
    expect(find.text('Cocktail Colorizer'), findsOneWidget);
  });
}
