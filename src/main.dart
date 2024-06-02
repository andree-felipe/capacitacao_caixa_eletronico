import "dart:io";

import "../models/Account.dart";
import "../models/Owner.dart";
import "../models/CashMachine.dart";

main() {
  stdout.write("Olá, você já possuí cadastro no nosso banco? (s/n) ");
  String answer = stdin.readLineSync()!;
  
  if(answer == "s") {
    stdout.write("\nJá possuí conta? (s/n) ");
    answer = stdin.readLineSync()!;

    if(answer == "s") {
      stdout.write("Por favor, insira seu CPF");
      String clientCPF = stdin.readLineSync()!;
    }
    else {
      print("Recomendamos que crie uma conta");
      
    }

    
    

    
    
    print("O que gostaria de fazer?");
    CashMachine mainMachine = CashMachine();
    mainMachine.showMenu();

    while() {

    }
  }
  else {
    print("Recomendamos que crie um cadastro\n");
    // Solicitação de informações para cadastro de um novo titular no sistema
    print("Por favor, insira as informações solicitadas, sobre o titular\n");

    stdout.write("Nome: ");
    String name = stdin.readLineSync()!;

    stdout.write("\nCPF: ");
    String CPF = stdin.readLineSync()!;

    stdout.write("\nNúmero para contato: ");
    String number = stdin.readLineSync()!;

    stdout.write("\nEmail: ");
    String email = stdin.readLineSync()!;

    Owner newOwner = Owner(0, name, CPF, number, email);

    bool status = newOwner.registerNewOwner(newOwner);

    if(status) {
      print("Titular cadastrado no sistema com sucesso");
    }
    else {
      print("Não foi possível cadastrar o usuário: CPF fornecido já está em uso");
    }
  }
}