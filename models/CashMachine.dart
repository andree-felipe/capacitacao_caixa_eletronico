import 'dart:io';

import 'Account.dart';
import 'Owner.dart';

class CashMachine {
  void startMachine(List<Owner> ownersList, List<Account> accountsList) {
    var status = true;

    print("\nSeja bem vindo ao AsiBank!\n");
    stdout.write("Por favor, insira seu CPF: ");
    String answeredCPF = stdin.readLineSync()!;

    while(status) {
      if(ownersList == []) {
        print("Após consulta do seu CPF, vimos que você não possuí cadastro no AsiBank!");
        stdout.write("Gostaria de se cadastrar? (s/n): ");
        String answer = stdin.readLineSync()!;

        // Criar cadastro
        if(answer == "s") {
          print("Por favor, insira as informações solicitadas\n");

          stdout.write("Nome: ");
          String name = stdin.readLineSync()!;

          stdout.write("\nCPF: ");
          String CPF = stdin.readLineSync()!;

          stdout.write("\nNúmero para contato: ");
          String number = stdin.readLineSync()!;

          stdout.write("\nEmail: ");
          String email = stdin.readLineSync()!;

          int id = ownersList.length++;

          Owner newOwner = Owner(id, name, CPF, number, email, 0);
          ownersList.add(newOwner);
          print("Cadastro criado com sucesso!");
          status = true;
        }
        // Não criar cadastro
        else {
          print("Volte sempre!");
          status = false;
        }
      }
      else {
        //Busca nos titulares cadastrados para ver se o cliente já possuí cadastro
        for(Owner activeOwner in ownersList) {
          // Cliente já possuí cadastro
          if(activeOwner.CPF == answeredCPF) {
            // Verificar se o titular possuí conta
            for(Account activeAccount in accountsList) {
              // Cliente também possuí conta
              if(activeAccount.id == activeOwner.accountId) {
                print("Olá, ${activeOwner.name}" + "\n");
                
                showMenu();
                useMachineMenu(activeAccount);

                status = false;
              }
              // Cliente tem cadastro mas não possuí conta
              else {
                print("Olá, ${activeOwner.name}! Após verificação do seu CPF, vimos que você é cadastrado, mas ainda não possuí uma conta!");
                stdout.write("Gostaria de criar uma? (s/n): ");
                String answer = stdin.readLineSync()!;

                // Criar conta
                if(answer == "s") {
                  int id = accountsList.length++;

                  Account newAccount = Account(id, 0, 500, activeOwner.id);
                  accountsList.add(newAccount);
                  activeOwner.accountId = newAccount.id;
                  print("Conta criada com sucesso");

                  stdout.write("Gostaria de utilizar algum de nosso serviços? (s/n): ");
                  answer = stdin.readLineSync()!;

                  // Quer utilizar algum serviço
                  if(answer == "s") {
                    print("Olá, ${activeOwner.name}" + "\n");
                
                    showMenu();
                    useMachineMenu(activeAccount);

                    status = false;
                  } 
                  // Não quer utilizar nenhum serviço
                  else {
                    print("Obrigado por utilizar o AsiBank. Volte sempre!");
                    status = false;
                  }
                }
                // Não criar conta
                else {
                  print("Volte sempre!");
                  status = false;
                }
              }
            }
          } 
          // Cliente não possuí cadastro
          else {
            print("Após consulta do seu CPF, vimos que você não possuí cadastro no AsiBank!");
            stdout.write("Gostaria de se cadastrar? (s/n): ");
            String answer = stdin.readLineSync()!;

            // Criar cadastro
            if(answer == "s") {
              print("Por favor, insira as informações solicitadas\n");

              stdout.write("Nome: ");
              String name = stdin.readLineSync()!;

              stdout.write("\nCPF: ");
              String CPF = stdin.readLineSync()!;

              stdout.write("\nNúmero para contato: ");
              String number = stdin.readLineSync()!;

              stdout.write("\nEmail: ");
              String email = stdin.readLineSync()!;

              int id = ownersList.length++;

              Owner newOwner = Owner(id, name, CPF, number, email, 0);
              ownersList.add(newOwner);
              print("Cadastro criado com sucesso!");
              status = true;
            }
            // Não criar cadastro
            else {
              print("Volte sempre!");
              status = false;
            }
          }
        }
      }
    }
  }

  void showMenu() {
    print("0 - Sair\n"); 
    print("1 - Saque\n"); 
    print("2 - Depósito\n"); 
    print("3 - Consulta de saldo\n"); 
    print("4 - Consulta de limite de saque\n");
  }

  void useMachineMenu(Account activeAccount) {
    stdout.write("Qual serviço gostaria de utilizar? ");
    int serviceNumber = int.parse(stdin.readLineSync()!);

    while(serviceNumber != 0) {
      // Saque
      if(serviceNumber == 1) {
        stdout.write("Insira o valor que deseja sacar: ");
        double withdrawValue = double.parse(stdin.readLineSync()!);
        activeAccount.withdraw(withdrawValue);
      }
      // Depósito
      else if(serviceNumber == 2) {
        stdout.write("Insira o valor que deseja depositar: ");
        double depositValue = double.parse(stdin.readLineSync()!);
        activeAccount.deposit(depositValue);
      }
      // Consulta de saldo
      else if(serviceNumber == 3) {
        print("Saldo atual da conta: R\$" + "${activeAccount.balance}" + "\n");
      }
      // Consulta de limite de saque
      else {
        print("O seu limite de saque atual é: R\$" + "${activeAccount.withdrawLimit}" + "\n");
      }

      showMenu();
      stdout.write("Qual serviço gostaria de utilizar? ");
      serviceNumber = int.parse(stdin.readLineSync()!);
    }
    
    print("Obrigado por utilizar os serviços do AsiBank. Volte Sempre!");
  }

}