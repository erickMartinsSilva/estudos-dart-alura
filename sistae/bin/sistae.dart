import 'dart:io';

class Aluno {
  String nome = "";
  List<double> notas = <double>[];

  Aluno(String x) {
    nome = x;
  }

  void adicionarNota(double nota) {
    notas.add(nota);
  }

  String calculaMedia() {
    double soma = 0;
    for(double nota in notas) {
      soma += nota;
    }

    return ((soma / notas.length).toStringAsFixed(1));
  }
}

void cabecalho() {
  print("\n888888                888888 88888");
  print("8      e  eeeee eeeee 8    8 8    ");
  print("8eeeee 8  8   8   88  8eeee8 8eeee");
  print("    88 8e 8eeee   8e  88   8 88   ");
  print("e   88 88    88   88  88   8 88   ");
  print("8eee88 88 8ee88   88  88   8 88eee");

  print("\n(Sistema de Acompanhamento Escolar)");
}

int menu() {
  String? entrada = "";

  print("\n1. Registrar aluno");
  print("2. Listar alunos");
  print("3. Sair");

  print("\nEscolha uma das opções acima:");
  entrada = stdin.readLineSync();

  if(entrada != null && entrada != "") {
    try {
      return int.parse(entrada);
    } on FormatException {
      print("ERRO: Formato inválido");
      return menu();
    }
  }

  return 0;
}

void registraAluno(List<Aluno> lista) {
  String? entrada = "";

  print("Digite o nome do aluno:");
  entrada = stdin.readLineSync();

  if(entrada == null || entrada == "") {
    print("ERRO: Nome inválido");
    registraAluno(lista);
  } else {
    Aluno aluno = Aluno(entrada);

    do {
      print("Insira as notas do aluno (escreva fim para finalizar):");
      entrada = stdin.readLineSync();

      if((entrada != null && entrada != "") && entrada != "fim") {
        try {
          aluno.adicionarNota(double.parse(entrada));
        } on FormatException {
          print("ERRO: Formato inválido");
        }
      }
    } while(entrada != "fim");

    lista.add(aluno);
    print("Aluno registrado com sucesso!");
  }
}

void exibirAlunos(List<Aluno> lista) {
  if(lista.isNotEmpty) {
      for(Aluno aluno in lista) {
      print("=== Aluno ${lista.indexOf(aluno) + 1} ===");
      print("Nome: ${aluno.nome}");
      print("Média: ${aluno.calculaMedia()}");
    }
  } else {
    print("\nNão há dados para exibir!");
  }
}
void main() {
  List<Aluno> listaAlunos = <Aluno>[];
  int opcao;

  cabecalho();
  
  do {
    switch(opcao = menu()) {
      case 1: registraAluno(listaAlunos);
      case 2: exibirAlunos(listaAlunos);
    }
  } while(opcao != 3);
  print("Desligando sistema...");
}