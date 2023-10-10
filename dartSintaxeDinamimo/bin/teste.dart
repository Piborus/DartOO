import 'transporte.dart';
import 'viagem.dart';

void main() {
  Viagem viagemMaio = Viagem(locomocao: Transporte.carro);
  print(viagemMaio.totalLocaisVisitados);
  viagemMaio.visitar('Museu');
  print(viagemMaio.totalLocaisVisitados);
  viagemMaio.alterarLocaisVisitados = 10;
  print(viagemMaio.totalLocaisVisitados);

}
