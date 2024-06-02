import 'owner.dart';

class Account {
  int _id;
  double _balance;
  double _withdrawLimit;

  Owner _accountOwner;

  Account(this._id, this._balance, this._withdrawLimit, this._accountOwner) {
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

  // Get e Set accountOwner
  Owner get accountOwner {
    return this._accountOwner;
  }

  void set accountOwner(Owner newOwner) {
    this._accountOwner = newOwner;
  }

  void withdraw(double withdrawValue) {
    if (withdrawValue > withdrawValue) {
      print("Não é possível realizar o saque: valor solicitado maior que seu limite de saque");
    }
    else if(withdrawValue > this._balance) {
      print("Não é possível realizar o saque: valor solicitado é maior que o saldo na conta");
      print("Saldo atual: R\$" + "${this._balance}");
    }
  }

  void deposit(double depositValue) {
    this._balance += depositValue;
  }

  double checkBalance() {
    return balance;
  }

  @override
  String toString() {
    return "----- Informações da conta ----- " + "\n" 
    + "Titular: ${this._accountOwner.name}" + "\n"
    + "Limite de saque: ${this._withdrawLimit}" + "\n"
    + "Saldo atual: R\$" + "${this._balance}" + "\n";
  }
}