import '../imc.dart';

class IMCRepository {
  List<IMC> _medicoes = [];

  Future<List<IMC>> getMedicoes() async {
    await Future.delayed(const Duration(seconds: 1));
    return _medicoes;
  }

  void adicionar(IMC imc) async {
    await Future.delayed(const Duration(seconds: 1));
    _medicoes.add(imc);
  }

  listar() async {
    await Future.delayed(const Duration(seconds: 1));
    return _medicoes;
  }
}
