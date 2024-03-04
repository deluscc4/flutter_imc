import 'package:flutter/material.dart';
import 'telas/tela_principal.dart';

void main() => runApp(CalculadoraIMC());

class CalculadoraIMC extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0xFF565656),
          appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.white),
            centerTitle: true,
            backgroundColor: Color(0xFF565656),
          ),
        ),
      home: TelaPrincipal(),
    );
  }
}

