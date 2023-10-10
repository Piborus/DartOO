import 'dart:math';

import 'controllers/bank_controller.dart';
import 'exceptions/bank_controller_exceptions.dart';
import 'models/account.dart';

void testingNullSafety(){
  Account? myAccount = Account(name: "Ricarth", balance: 200, isAuthenticated: true);;

  //Simulando uma comunicação externa
  Random rng = Random();
  int randomNumber = rng.nextInt(10);
  if(randomNumber <= 5){
    myAccount.createdAt = DateTime.now();
  }
  print(myAccount.runtimeType);

  print(myAccount.createdAt);
  //print(myAccount.createdAt.day);

  if(myAccount != null){
    print(myAccount.balance);
    if(myAccount.createdAt != null){
      print(myAccount.createdAt!.day);
    }
  }else{
    print("Conta nula");
  }

  //Operador Ternario
  print(myAccount != null ? myAccount.balance : "Conta nula");

  //safe call
  print(myAccount?.balance);
  
  if(rng.nextInt(10) % 2 == 0){
    myAccount =
        Account(name: "Ricarth Lima", balance: 300, isAuthenticated: true);
  }
  print(myAccount.runtimeType);
}
void main() {

  testingNullSafety();

  // Criando o banco
  BankController bankController = BankController();

  // Adicionando contas
  bankController.addAccount(
      id: "Ricarth",
      account:
          Account(name: "Ricarth Lima", balance: 400, isAuthenticated: true));

  bankController.addAccount(
      id: "Kako",
      account:
          Account(name: "Caio Couto", balance: 600, isAuthenticated: true));

  // Fazendo transferência
  try {
    bool result = bankController.makeTransfer(
        idSender: "Kako", idReceiver: "Ricarth", amount: 700);
    // Observando resultado
    print(result);
  } on SenderIdInvalidException catch (e) {
    print(e);
    print('O ID ${e.idSender} do remetente não é um ID válido.');
  } on ReceiverIdInvalidException catch (e){
    print(e);
    print('O ID ${e.idReceiver} do destinatário não é um ID válido.');
  } on SenderNotAuthenticatedException catch (e){
    print(e);
    print('O usuario remetente de ID ${e.idSender} não está autenticado.');
  } on SenderBalanceLowerThanAmountException catch (e){
    print(e);
    print('O usuario de ID ${e.idSender} tentou enviar ${e.amount} sendo que na sua conta tem apenas'
        ' ${e.senderBalance}');
  } on Exception {
    print("Algo deu errado.");
  }

  String naoPodeSerNula = "MyString";
  //naoPodeSerNula = null;

  String? podeSerNula = "MyString";
  podeSerNula = null;
}
