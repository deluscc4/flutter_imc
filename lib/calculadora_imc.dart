import 'dart:math';

class CalculadoraIMC {
  CalculadoraIMC({required this.altura, required this.peso});

  final int? altura;
  final int? peso;
  double? _imc;

  String? calcularIMC() {
    _imc = (peso! / pow(altura! / 100, 2))!;
    return _imc?.toStringAsFixed(1);
  }

  String obterResultado() {
    if (_imc! >= 25) {
      return 'Acima do peso';
    } else if (_imc! > 18.5) {
      return 'Normal';
    } else {
      return 'Abaixo do peso';
    }
  }

  String obterInterpretacao() {
    if (_imc! >= 25) {
      return 'Seu IMC consta acima do peso. Cheque com o seu nutricionista o seu contexto físico para ter certeza se está tudo certo.';
    } else if (_imc! > 18.5) {
      return 'Excelente! O seu IMC consta normal.';
    } else {
      return 'Seu IMC consta abaixo do peso. Cheque com o seu nutricionista o seu contexto físico para ter certeza se está tudo certo.';
    }
  }
}