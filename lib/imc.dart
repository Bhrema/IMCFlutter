import 'package:flutter/cupertino.dart';

class IMC {
  final String _id = UniqueKey().toString();
  double _peso;
  double _altura;
  double _imc;

  IMC(this._peso, this._altura, this._imc);

  double get imc => _imc;

  set imc(double value) {
    _imc = value;
  }

  double get altura => _altura;

  set altura(double value) {
    _altura = value;
  }

  double get peso => _peso;

  set peso(double value) {
    _peso = value;
  }

  String get id => _id;
}
