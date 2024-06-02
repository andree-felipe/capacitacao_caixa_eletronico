import "dart:io";

import "Account.dart";

class Owner {
  int _id;
  String _name;
  String _CPF;
  String _number;
  String _email;

  Account account;
  
  // Lista de armazenamento de todos os titulares cadastrados no sistema
  List<Owner> _ownersList = List.empty(growable: true);

  // Construtor 
  Owner(this._id, this._name, this._CPF, this._number, this._email) {
  }

  //Get e Set ID
  int get id {
    return this._id;
  }

  void set id(int newId) {
    this._id = newId;
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
  
  bool registerNewOwner(Owner newOwner) {
    // ID incremental para evitar repetição
    int incrementalId = _ownersList.length++;

    newOwner.id = incrementalId;

    for(Owner owner in _ownersList) {
      if(owner.CPF == newOwner.CPF) {
        return false;
      }
    }

    _ownersList.add(newOwner);
    return true; 
  }

  // Método para retorno de todos os titulares cadastrados no sistema
  List<Owner> getOwnersList() {
    return this._ownersList;
  }

  Owner getOwner(clientCPF) {
    for(Owner owner in _ownersList) {
      if(owner._CPF == clientCPF) {
        return owner;
      }
    }
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