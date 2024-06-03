class Account {
  int _id;
  double _balance;
  double _withdrawLimit;
  int _ownerId;

  Account(this._id, this._balance, this._withdrawLimit, this._ownerId) {
  }

  // Get e Set ID
  int get id {
    return this._id;
  }

  void set id(int newId) {
    this._id = newId;
  }

  // Get e Set balance
  double get balance {
    return this._balance;
  }

  void set balance(newBalance) {
    this.balance = newBalance;
  }

  // Get e Set withdrawLimit
  double get withdrawLimit {
    return this._withdrawLimit;
  }

  void set withdrawLimit(double newWithdrawLimit) {
    this._withdrawLimit = newWithdrawLimit;
  }

  // Get e Set ownerId
  int get ownerId {
    return this._ownerId;
  }

  void set ownerId(int newOwnerId) {
    this._ownerId = newOwnerId;
  }

  void withdraw(double withdrawValue) {
    if (withdrawValue > withdrawValue) {
      print("Não é possível realizar o saque: valor solicitado maior que seu limite de saque\n");
      print("Seu limite de saque é: R\$" + "${this._withdrawLimit}");
    }
    else if(withdrawValue > this._balance) {
      print("Não é possível realizar o saque: valor solicitado é maior que o saldo na conta\n");
      print("Saldo atual: R\$" + "${this._balance}");
    }
    else {
      this._balance -= withdrawValue;
      print("Saque realizado com sucesso!\n");
      print("Saldo atual: R\$" + "${this._balance}");
    }
  }

  void deposit(double depositValue) {
    this._balance += depositValue;
    print("Deposito realizado com sucesso!\n");
    print("Seu saldo atual é: R\$" + "${this._balance}");
  }

  @override
  String toString() {
    return "----- Informações da conta ----- " + "\n" 
    + "Id da conta: ${this._id}" + "\n"
    + "Limite de saque: ${this._withdrawLimit}" + "\n"
    + "Saldo atual: R\$" + "${this._balance}" + "\n";
  }
}