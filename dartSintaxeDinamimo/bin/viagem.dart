import 'transporte.dart';

class Viagem {
  static String codigoTrabalho = "fjajfja";
  double dinheiro = 0;
  Transporte locomocao;
  Set<String> registrosVisitados = <String>{};
  Map<String, double> registrarPrecos = {};
  int _totalLocaisVisitados = 0;

  int get totalLocaisVisitados{
    return _totalLocaisVisitados;
  }

  void set alterarLocaisVisitados(int novaQnt){
    if(novaQnt < 10){
      _totalLocaisVisitados = novaQnt;
    }else{
      print('Não é possivel!');
    }
  }

  Viagem({required this.locomocao});

  printCodigo() {
    print(codigoTrabalho);
  }

  void escolherMeioTransporte(Transporte locomocao) {
    /*if (locomocao == Tranposte.carro) {
    print('Vou de carro!');
  } else if (locomocao == Tranposte.bike) {
    print('Vou de bike');
  } else {
    print('Vou para aventura!');
  }*/
    switch (locomocao) {
      case Transporte.carro:
        print('Vou de carro!');
        break;
      case Transporte.bike:
        print('Vou de bike');
        break;
      case Transporte.andando:
        print('Vou andando!');
      default:
        print('Estou indo para aventura, isso é o que importa');
    }
  }

  void visitar(String localVisita) {
    _totalLocaisVisitados += 1;
  }

  void registraPrecoVisita(String local, dynamic preco) {
    registrarPrecos[local] = preco;
  }


}
