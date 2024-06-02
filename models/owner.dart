import 'dart:collection';
import "dart:io";

class Owner {
  final int id;
  String _name;
  String _CPF;
  String _number;
  String _email;
  
  // Lista de armazenamento de todos os titulares cadastrados no sistema
  List<Owner> _ownersList = List.empty(growable: true);

  // Construtor 
  Owner(this.id, this._name, this._CPF, this._number, this._email) {
  }

  // Get e Set name
  String get name {
    return this._name;
  }

  void set name(String newName) {
    if(newName == this._name) {
      print("Não foi possível fazer a alteração: novo nome é igual ao anterior");
    }
    else {
      this._name = newName;
    }
  }

  // Get CPF
  String get CPF {
    return this._CPF;
  }

  // Get e Set number
  String get number {
    return this._number;
  }

  void set number(String newNumber) {
    if(newNumber == this._number) {
      print("Não foi possível fazer a alteração: novo número é igual ao anterior");
    }
    else {
      this._number = newNumber;
    }
  }

  // Get e Set email
  String get email {
    return this._email;
  }

  void set email(String newEmail) {
    if(newEmail == this._email) {
      print("Não foi possível fazer a alteração: novo email é igual ao anterior");
    }
    else {
      this._email = newEmail;
    }
  }
  
  void registerNewOwner() {
    var ownersList = getOwnersList();

    // Solicitação de informações para cadastro de um novo titular no sistema
    print("Por favor, insira as informações solicitadas, sobre o titular");

    stdout.write("Nome: ");
    String name = stdin.readLineSync()!;

    stdout.write("CPF: ");
    String CPF = stdin.readLineSync()!;

    stdout.write("Número para contato: ");
    String number = stdin.readLineSync()!;

    stdout.write("Email: ");
    String email = stdin.readLineSync()!;

    // ID incremental para evitar repetição
    int id = ownersList.length++;

    for(Owner owner in ownersList) {
      if(owner.CPF == CPF) {
        print("Erro ao cadastrar novo titular: CPF fornecido já está em uso");
        return;
      }
      else {
        Owner newOwner = Owner(id, name, CPF, number, email);
        ownersList.add(newOwner);
      }
    }
  }

  // Método para retorno de todos os titulares cadastrados no sistema
  List<Owner> getOwnersList() {
    return this._ownersList;
  }

  @override
  String toString() {
    return "----- Informações do Titular ----- " + "\n"
    + "Nome: ${this._name}" + "\n" 
    + "CPF: ${this._CPF}" + "\n"
    + "Contato: ${this._number}" + "\n"
    + "Email: ${this._email}" + "\n";
  }

}