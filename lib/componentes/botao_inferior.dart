import 'package:flutter/material.dart';
import '../telas/tela_principal.dart';
import '../constantes.dart';

class BotaoInferior extends StatelessWidget {

  BotaoInferior({required this.aoPressionar, required this.tituloBotao});

  final void Function()? aoPressionar;
  final String tituloBotao;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: aoPressionar,
      child: Container(
        child: Center(child: Text(tituloBotao, style: kBotaoGrandeTextStyle)),
        color: corContainerInferior,
        margin: EdgeInsets.only(top: 10.0),
        padding: EdgeInsets.only(bottom: 20.0),
        width: double.infinity,
        height: alturaContainerInferior,
      ),
    );
  }
}


