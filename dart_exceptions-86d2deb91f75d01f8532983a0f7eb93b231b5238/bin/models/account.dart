class Account {
  String name;
  double balance;
  bool isAuthenticated;
  DateTime? createdAt;

  Account(
      {required this.name,
      required this.balance,
      required this.isAuthenticated,
      this.createdAt}):
  assert(name.isNotEmpty, 'O nome não pode ser uma string vazia'),
  assert(balance >= 0, "O saldo não pode ser negativo");

  editBalance({required value}) {
    balance = balance + value;
  }
}
// Começando com o factory, essa é uma palavra-chave usada para implementar
// um construtor que nem sempre cria uma instância de sua classe. Por exemplo, um construtor de
// fábrica pode retornar uma instância de um cache ou pode retornar uma instância
// de um subtipo. Outro caso de uso para construtores de fábrica é inicializar uma variável
// final usando uma lógica que não pode ser tratada na lista de inicializadores.

// Já o external é uma palavra chave que gera um função abstrata em uma classe que
// não necessariamente é abstrata. Basicamente diz que o corpo da função será
// definido em um local externo.