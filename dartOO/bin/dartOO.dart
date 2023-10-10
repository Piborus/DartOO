void main() {
  String nome = "Laranja";
  double peso = 100.2;
  String corFruta = "verde e amarela";
  String sabor = "Doce e citrico";
  int diasDesdeColheita = 20;

  print(funcEstaMadura(50));
  mostraMadura("uva", 40, cor: "roxa");
  int quantosDias = funcQuantosDiasMadura(diasDesdeColheita);
  print(quantosDias);

  Fruta fruta = Fruta(nome, peso, corFruta, sabor, diasDesdeColheita);
  Fruta fruta1 = Fruta(nome, peso, corFruta, sabor, diasDesdeColheita);
  Fruta fruta2 = Fruta("Uva", 40, "Roxa", "Doce", 20);
  print(fruta1.nome);
  print(fruta1);

  print(fruta2.nome);
  print(fruta2);

  fruta1.estaMadura(30);
  fruta2.estaMadura(60);

  Legumes mandioca = Legumes('macaxeira', 1200, 'marrom', true);
  Fruta banana = Fruta('banana', 75, 'amarelo', 'doce', 12);
  Nozes macadamia = Nozes('Macadamia', 2, 'Branco amarelado', 'doce', 20, 35);
  Citricas limao = Citricas('limão', 50, '50', 'azedo', 5, 9);

  mandioca.printAlimento();
  banana.printAlimento();
  macadamia.printAlimento();
  limao.printAlimento();

  mandioca.cozinhar();
  limao.fazerSuco();
  //limao.cozinhar(); não funciona
  //mandioca.fazerSuco(); não funciona

  macadamia.fazerMassa();

}

class Fruta extends Alimento implements Bolo {
  String sabor;
  int diaDesdeColheita;
  bool? isMadura;

  Fruta(
      String nome, double peso, String cor, this.sabor, this.diaDesdeColheita,
      {this.isMadura})
      : super(nome, peso, cor);

  estaMadura(int diasParaMadura) {
    isMadura = diaDesdeColheita >= diasParaMadura;
    print("A sua $nome foi colhida a $diaDesdeColheita dias, "
        "e precisa de $diasParaMadura para poder comer. "
        "Ela esta madura? $isMadura");
  }

  fazerSuco() {
    print("Você fez um otimo suco de $nome");
  }

  @override
  void assar() {
    print('coloca no forno.');
  }

  @override
  void fazerMassa() {
    print('Misturar a fruta com farinha, açucar, ovos...');
  }

  @override
  void separarIngredientes() {
    print('Catar a fruta');
  }
}

class Alimento {
  String nome;
  double peso;
  String cor;

  Alimento(this.nome, this.peso, this.cor);

  void printAlimento() {
    print('Este(a) $nome pesa $peso gramas de $cor.');
  }
}

class Legumes extends Alimento implements Bolo{
  bool isPrecisaCozinhar;

  Legumes(String nome, double peso, String cor, this.isPrecisaCozinhar)
      : super(nome, peso, cor);

  void cozinhar() {
    if (isPrecisaCozinhar) {
      print('Pronto, o $nome está cozinhando!');
    } else {
      print('Nem precisa cozinhar!');
    }
  }

  @override
  void assar() {
    // TODO: implement assar
  }

  @override
  void fazerMassa() {
    // TODO: implement fazerMassa
  }

  @override
  void separarIngredientes() {
    // TODO: implement separarIngredientes
  }
}

class Citricas extends Fruta {
  double nivelAzedo;

  Citricas(String nome, double peso, String cor, String sabor, int diaDesdeColheita,
      this.nivelAzedo)
  : super(nome, peso, cor, sabor, diaDesdeColheita);

  existeRefri(bool existe){
    if(existe){
      print('Existe Refrigerante de $nome');
    }
    else{
      print('Não existe refri de $nome');
    }
  }
}

class Nozes extends Fruta {
  double porcentagemOleoNatural;

  Nozes(String nome, double peso, String cor, String sabor, int diaDesdeColheita,
      this.porcentagemOleoNatural)
  : super(nome, peso, cor, sabor, diaDesdeColheita);

  @override
  void fazerMassa(){
    print('Tira a casca');
    super.fazerMassa();
  }
}

funcQuantosDiasMadura(int dias) {
  int diasParaMadura = 30;
  int quantosDiasFaltam = dias - diasParaMadura;
  return quantosDiasFaltam;
}

//1- Posicionais Obrigatorios = Nome (Obrigatório)
//2- Nomeados Opcionais = Sabor (Opcional, com valor padrão = “doce”)
//3- Parametros "Padrão ou default"
//4- Modificador "required"

mostraMadura(String nome, int dias, {required String cor}) {
  if (dias >= 30) {
    print("A $nome está madura.");
  } else {
    print("A $nome não está madura.");
  }

  if (cor != null) {
    print("A $nome é $cor");
  }
}

bool funcEstaMadura(int dias) {
  if (dias >= 30) {
    return true;
  } else {
    return false;
  }
}

abstract class Bolo{
  //separo os ingredientes
  void separarIngredientes();
  //faço a massa
  void fazerMassa();
  //assar
  void assar();
}
