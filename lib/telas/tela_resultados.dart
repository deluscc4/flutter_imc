import 'package:flutter/material.dart';
import 'package:imccalc_flutter/telas/tela_principal.dart';
import '../constantes.dart';
import '../componentes/cartao_padrao.dart';
import '../componentes/botao_inferior.dart';

class TelaResultados extends StatelessWidget {
  TelaResultados({required this.resultadoIMC, required this.resultadoTexto, required this.interpretacao});

  final String resultadoIMC;
  final String resultadoTexto;
  final String interpretacao;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.only(left: 15.0),
              alignment: Alignment.bottomLeft,
              child: Text('Resultado', style: kTituloTextStyle),
            ),
          ),
          Expanded(
            flex: 5,
            child: CartaoPadrao(
              cor: kCorAtivaCartaoPadrao,
              aoPressionar: () {},
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(resultadoTexto.toUpperCase(), style: kResultadoTextStyle),
                  Text(resultadoIMC, style: kIMCTextStyle),
                  Text(interpretacao, style: kCorpoTextStyle)
                ],
              ),
            ),
          ),
          BotaoInferior(
              aoPressionar: () {
                Navigator.pop(context);
              },
              tituloBotao: 'Recalcular')
        ],
      ),
    );
  }
}
