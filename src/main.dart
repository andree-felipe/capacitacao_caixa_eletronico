import "../models/Account.dart";
import "../models/Owner.dart";
import "../models/CashMachine.dart";

main() {
  // Lista com os titulares cadastrados no sistema
  List<Owner> ownersList = [];
  // Lista com todas contas cadastradas no sistema
  List<Account> accountsList = [];

  CashMachine mainMachine = CashMachine();
  
  mainMachine.startMachine(ownersList, accountsList);
}