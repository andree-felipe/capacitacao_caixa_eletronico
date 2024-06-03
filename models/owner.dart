class Owner {
  int _id;
  String _name;
  String _CPF;
  String _number;
  String _email;
  int _accountId;
  
  // Construtor 
  Owner(this._id, this._name, this._CPF, this._number, this._email, this._accountId) {
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

  // Get e Set accountId
  int get accountId {
    return this._accountId;
  }

  void set accountId(int newAccountId) {
    this._accountId = newAccountId;
  }
  
  // Método para registro de um novo titular
  bool registerNewOwner(List<Owner> ownersList, Owner newOwner) {
    // ID incremental para evitar repetição
    int incrementalId = ownersList.length++;

    newOwner.id = incrementalId;

    for(Owner owner in ownersList) {
      if(owner.CPF == newOwner.CPF) {
        return false;
      }
    }

    ownersList.add(newOwner);
    return true; 
  }

  @override
  String toString() {
    return "----- Informações do Titular ----- " + "\n"
    + "Id: ${this._id}" + "\n"
    + "Nome: ${this._name}" + "\n" 
    + "CPF: ${this._CPF}" + "\n"
    + "Contato: ${this._number}" + "\n"
    + "Email: ${this._email}" + "\n";
  }

}