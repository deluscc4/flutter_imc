import 'package:flutter/material.dart';

class CartaoPadrao extends StatelessWidget {
  CartaoPadrao({required this.cor, required this.filhoCartao, required this.aoPressionar});

  final Color cor;
  final Widget filhoCartao;
  final Function()? aoPressionar;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: filhoCartao,
        margin: EdgeInsets.all(20.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: cor,
        ),
      ),
    );
  }
}