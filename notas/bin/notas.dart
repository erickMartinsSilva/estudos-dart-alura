/* 
Projeto de Notas com Dart

Objetivos do projeto:
1. Permitir com que o usuário adicione notas ✅
2. Permitir com que o usuário possa visualizar todas as suas notas ✅
3. Permitir com que o usuário possa sair da aplicação ✅

Objetivos bônus (que eu inventei):
1. Permitir com que o usuário remova notas ✅
2. Permitir com que o usuário exporte suas notas para um arquivo .txt (?)
*/

import 'dart:io';

void cabecalho() {
  print("  _  _     _           ");
  print(" | \| |___| |_ __ _ ___");
  print(" | .\` / _ \  _/ _\` (_-<");
  print(" |_|\_\___/\__\__,_/__/");
  print("                       ");
}

int menu() {
  List<String> listaOpcoes = <String>["1", "2", "3", "4"];
  String? entrada = "";

  print("1. Adicionar nota");
  print("2. Remover notas");
  print("3. Listar notas");
  print("4. Sair\n");

  print("Escolha a opção desejada:");
  entrada = stdin.readLineSync();

  if(entrada == null || !listaOpcoes.contains(entrada)) {
    print("ERRO: Opção inválida");
    return menu();
  }
  return int.parse(entrada);
}

void adicionarNota(List<String> listaNotas) {
  String? entrada = "";

  print("Escreva uma nota:");
  entrada = stdin.readLineSync();

  if(entrada != null && entrada != "") {
    listaNotas.add(entrada);
    print("Nota adicionada com sucesso!\n");
  } else {
    print("ERRO: Formato inválido.");
    adicionarNota(listaNotas);
  }
}

void removerNota(List<String> listaNotas) {
  print("Insira o índice da nota que deseja remover: ");
  try {
    int entrada = int.parse(stdin.readLineSync()!);

    if(listaNotas.contains(listaNotas[entrada-1])) {
      listaNotas.remove(listaNotas[entrada-1]);
      print("Nota removida com sucesso!");
    } else {
      print("O índice inserido não pertence a nenhuma nota");
    }
  } on FormatException {
    print("ERRO: Entrada inválida");
    removerNota(listaNotas);
  }
}

void listarNotas(List<String> listaNotas) {
  if(listaNotas.isEmpty) {
    print("Não há notas para exibir!");
  } else {
    for(int i = 0; i < listaNotas.length; i++) {
      print("${i+1}. ${listaNotas[i]}");
    }
  }
}

void main() {
  List<String> listaNotas = <String>[];
  int opcao;

  cabecalho();

  do {
    switch(opcao = menu()) {
      case 1: adicionarNota(listaNotas);
      case 2: removerNota(listaNotas);
      case 3: listarNotas(listaNotas);
      case 4: break;
    }
  } while(opcao != 4);
  print("Tchau!");
}