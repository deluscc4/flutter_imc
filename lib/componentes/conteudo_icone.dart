import 'package:flutter/material.dart';
import '../constantes.dart';

class ConteudoIcone extends StatelessWidget {
  ConteudoIcone({required this.icone, required this.texto});

  final IconData icone;
  final String texto;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(icone, size: kIconSize,),
        SizedBox(height: kSizedBoxHeight),
        Text(texto, style: kDescricaoTextStyle),
      ],
    );
  }
}
