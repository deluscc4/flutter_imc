import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../componentes/conteudo_icone.dart';
import '../componentes/cartao_padrao.dart';
import '../constantes.dart';
import 'tela_resultados.dart';
import '../componentes/botao_arredondado.dart';
import '../componentes/botao_inferior.dart';
import 'package:imccalc_flutter/calculadora_imc.dart';

Genero? generoSelecionado;
int altura = 180;
int peso = 60;
int idade = 20;

enum Genero {
  masculino,
  feminino,
}

const alturaContainerInferior = 80.0;
const corContainerInferior = Color(0xFFFF5822);

class TelaPrincipal extends StatefulWidget {
  @override
  _TelaPrincipalState createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULADORA IMC'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {
                      setState(() {
                        generoSelecionado = Genero.masculino;
                      });
                    },
                    cor: generoSelecionado == Genero.masculino
                        ? kCorAtivaCartaoPadrao
                        : kCorInativaCartaoPadrao,
                    filhoCartao: ConteudoIcone(
                        icone: FontAwesomeIcons.mars, texto: 'MASCULINO'),
                  ),
                ),
                Expanded(
                  child: CartaoPadrao(
                      aoPressionar: () {
                        setState(() {
                          generoSelecionado = Genero.feminino;
                        });
                      },
                      cor: generoSelecionado == Genero.feminino
                          ? kCorAtivaCartaoPadrao
                          : kCorInativaCartaoPadrao,
                      filhoCartao: ConteudoIcone(
                          icone: FontAwesomeIcons.venus, texto: 'FEMININO')),
                ),
              ],
            ),
          ),
          Expanded(
            child: CartaoPadrao(
              aoPressionar: () {},
              cor: kCorAtivaCartaoPadrao,
              filhoCartao: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('ALTURA', style: kDescricaoTextStyle),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(altura.toString(), style: kNumeroTextStyle),
                      Text('cm', style: kDescricaoTextStyle)
                    ],
                  ),
                  Expanded(
                    child: Slider(
                        value: altura.toDouble(),
                        min: 100.0,
                        max: 210.0,
                        activeColor: Color(0xFFFF5822),
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double novoValor) {
                          setState(() {
                            altura = novoValor.round();
                          });
                        }),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: CartaoPadrao(
                    aoPressionar: () {},
                    cor: kCorAtivaCartaoPadrao,
                    filhoCartao: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('PESO', style: kDescricaoTextStyle),
                        Text(peso.toString(), style: kNumeroTextStyle),
                        Expanded(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              BotaoArredondado(
                                icone: FontAwesomeIcons.minus,
                                acao: () {
                                  setState(() {
                                    if (peso >= 1 && idade <= 230) {
                                      peso--;
                                    } else {

                                    }
                                  });
                                },
                              ),
                              SizedBox(width: 10.0),
                              BotaoArredondado(
                                icone: FontAwesomeIcons.plus,
                                acao: () {
                                  setState(() {
                                    if (peso >= 0 && peso <= 229) {
                                      peso++;
                                    } else {

                                    }
                                  });
                                },
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: CartaoPadrao(
                        aoPressionar: () {},
                        cor: kCorAtivaCartaoPadrao,
                        filhoCartao: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('IDADE', style: kDescricaoTextStyle),
                            Text(idade.toString(), style: kNumeroTextStyle),
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BotaoArredondado(
                                    icone: FontAwesomeIcons.minus,
                                    acao: () {
                                      setState(() {
                                        if (idade >= 1 && idade <= 110) {
                                          idade--;
                                        } else {

                                        }
                                      });
                                    },
                                  ),
                                  SizedBox(width: 10.0),
                                  BotaoArredondado(
                                    icone: FontAwesomeIcons.plus,
                                    acao: () {
                                      setState(() {
                                        if (idade >= 0 && idade <= 109) {
                                          idade++;
                                        } else {

                                        }
                                      });
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ))),
              ],
            ),
          ),
          BotaoInferior(
            aoPressionar: () {
              CalculadoraIMC calc = CalculadoraIMC(altura: altura, peso: peso);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TelaResultados(
                    resultadoIMC: calc.calcularIMC()!,
                    resultadoTexto: calc.obterResultado(),
                    interpretacao: calc.obterInterpretacao(),
                  ),
                ),
              );
            },
            tituloBotao: 'Calcular',
          )
        ],
      ),
    );
  }
}

