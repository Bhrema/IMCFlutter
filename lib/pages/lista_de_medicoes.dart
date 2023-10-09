import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:imc/imc.dart';
import 'package:imc/repository/imc_repository.dart';

class ListaDeMedicoes extends StatefulWidget {
  const ListaDeMedicoes({super.key});

  @override
  State<ListaDeMedicoes> createState() => _ListaDeMedicoesState();
}

class _ListaDeMedicoesState extends State<ListaDeMedicoes> {
  var repo = IMCRepository();
  List<IMC> _medicoes = [];

  @override
  void initState() {
    obterMedicoes();
    super.initState();
  }

  void obterMedicoes() async {
    _medicoes = await repo.listar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista de medições"),
      ),
      body: ListView.builder(
        itemCount: _medicoes.length,
        itemBuilder: (BuildContext bc, int index) {
          var medicao = _medicoes[index];
          print(medicao.imc);
          return Column(
            children: [
              Text("${medicao.peso}"),
              Text("${medicao.altura}"),
              Text("${medicao.imc}")
            ],
          );
        },
      ),
    );
  }
}
