import 'package:flutter/material.dart';

void main() {
  runApp(CocktailColorizerApp());
}

class CocktailColorizerApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cocktail Colorizer',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cocktail Colorizer'),
      ),
      body: Center(
        child: Text('Welcome to Cocktail Colorizer!'),
      ),
    );
  }
}
