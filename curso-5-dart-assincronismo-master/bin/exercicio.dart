void main() {
  Future fofoca(int a, int b) async {
    try {
      if (a < b) {
        throw Exception();
      }
      print('João: bom dia, grupo');
      await Future.delayed(Duration(seconds: 1));
      print('Mariana: Bom dia! Tudo bem?');
      await Future.delayed(Duration(seconds: 30));
      print('João: Suave, e vc?');
      await Future.delayed(Duration(seconds: 1));
      print('Certinho');
    } catch (e) {
      print('A fofoca não aconteceu');
      return 0;
    } finally {
      print('A fococa acabou');
    }
  }

  fofoca(2, 1)
      .then((value) => ('A fofoca esta acontecendo'))
      .whenComplete(() => print('conhece o rato'));

}
