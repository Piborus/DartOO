void main() {
  String nome = "Laranja";
  double peso = 98;
  int diasDesdeColheita = 30;
  int diasParaMadura = 20;
  bool isMadura = true;

  print(funcFrutas(nome: "banana", peso: 24, diasDesdeColheita: 10));
}

String funcFrutas(
    {required String nome,
    required double peso,
    required diasDesdeColheita,
    int diasParaMadura = 30,
    bool? isMadura}) {
  if (isMadura == null) {
    isMadura = diasDesdeColheita >= diasParaMadura;
  }

  String madura = "";
  if (isMadura != null && !isMadura) {
    madura = "não ";
  }

  String result =
      "A $nome pesa $peso gramas! Ela foi colhida há $diasDesdeColheita dias "
      "e precisa de  $diasParaMadura dias para amadurecer, logo"
      ", a $nome ${madura} está madura!";
      return result;
}
