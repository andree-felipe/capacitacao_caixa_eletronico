import 'owner.dart';

class CashMachine {
  Owner activeOwner;

  CashMachine(this.activeOwner) {
  }

  void showMenu() {
    print("0 - Sair\n"); 
    print("1 - Consulta de saldo\n"); 
    print("2 - Saque\n"); 
    print("3 - Depósito\n"); 
  }
}