import 'package:flutter/material.dart';
import 'package:imc/repository/imc_repository.dart';

import '../imc.dart';
import '../widgets/customDrawer.dart';

class CalculadoraPage extends StatefulWidget {
  CalculadoraPage({super.key});

  @override
  State<CalculadoraPage> createState() => _CalculadoraPageState();
}

class _CalculadoraPageState extends State<CalculadoraPage> {
  var repo = IMCRepository();
  var pesoController = TextEditingController(text: "");
  var alturaController = TextEditingController(text: "");
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EDDC),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(164, 255, 164, 1),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(196, 196, 245, 224),
          fontWeight: FontWeight.w900,
          fontSize: 24,
        ),
        title: const Text("IMC calculator"),
      ),
      drawer: const CustomDrawer(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(child: Container()),
                Expanded(
                    flex: 5, child: Image.asset('assets/images/imc_logo.png')),
                Expanded(child: Container()),
              ],
            ),
            Container(
              width: double.infinity,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: pesoController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(196, 196, 245, 224)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(196, 196, 245, 224)),
                  ),
                  hintText: "Peso",
                  hintStyle: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w500),
                  prefixIcon: Icon(
                    Icons.scale,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              height: 30,
              margin: const EdgeInsets.symmetric(horizontal: 30),
              alignment: Alignment.center,
              child: TextField(
                keyboardType: TextInputType.number,
                controller: alturaController,
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.only(top: 0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(196, 196, 245, 224)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromARGB(196, 196, 245, 224)),
                  ),
                  hintText: "Altura",
                  hintStyle: TextStyle(
                      color: Colors.green, fontWeight: FontWeight.w500),
                  prefixIcon: Icon(
                    Icons.height,
                    color: Colors.green,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: 100,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  color: Colors.green),
              child: TextButton(
                onPressed: () {
                  if (alturaController.text.isEmpty &&
                      pesoController.text.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("tente novamente")));
                  } else {
                    double altura = double.parse(alturaController.text);
                    double peso = double.parse(pesoController.text);

                    double imc = peso / (altura * altura);
                    var obj1 = IMC(peso, altura, imc);
                    repo.adicionar(IMC(obj1.peso, obj1.altura, obj1.imc));

                    print(obj1.peso);
                    print(obj1.altura);
                    print(obj1.imc);

                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Calculo do IMC"),
                            content: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                    "O valor do seu IMC é:: ${imc.toStringAsFixed(2)}")
                                //TODO - Linkar com a lista de string dizendo a condição referente do IMC.
                              ],
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                  setState(() {}); // Fecha o dialog
                                },
                                child: Text("Fechar"),
                              ),
                            ],
                          );
                        });
                  }
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(color: Color(0xFFF5EDDC)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
