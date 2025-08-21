import 'dart:io';

void soma(double x, double y) {
  print(x+y);
}

void subtrai(double x, double y) {
  print(x-y);
}

void multiplica(double x, double y) {
  print(x*y);
}

void divide(double x, double y) {
  print(x/y); 
}

void calcular(String operacao, double numero1, double numero2) {
  switch(operacao) {
    case "+": soma(numero1, numero2);
    case "-": subtrai(numero1, numero2);
    case "*": multiplica(numero1, numero2);
    case "/": divide(numero1, numero2);
  }
}

double setNumero(String? entrada) {
  entrada = stdin.readLineSync();

  if(entrada != null && entrada != "") {
    try {
      return double.parse(entrada);
    } on FormatException {
      print("Formato inválido, tente novamente");
      return setNumero(entrada);
    }
  }

  return 0;
}

String setOperacao(String? entrada, List<String> operacoes) {
  print("Insira uma operação ${operacoes.toString()}: ");
  entrada = stdin.readLineSync();

  if(entrada == null || !operacoes.contains(entrada)) {
    print("Operação inválida, tente novamente.");
    return setOperacao(entrada, operacoes);
  }

  return entrada;
}
void main() {
  List<String> operacoes = <String>["+", "-", "*", "/"];
  double numero1, numero2;
  String operacao = "";
  String? entrada;

  print("===== CALCULADORA =====");

  print("Número 1: ");
  numero1 = setNumero(entrada);

  operacao = setOperacao(entrada, operacoes);

  print("Número 2: ");
  numero2 = setNumero(entrada);

  print("O resultado da operação é: ");
  calcular(operacao, numero1, numero2);
}
