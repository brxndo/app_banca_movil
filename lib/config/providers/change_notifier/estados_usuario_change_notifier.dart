import 'package:flutter/material.dart';

class EstadosUsuarioChangeNotifier extends ChangeNotifier {
  bool _isLoading = false;
  int _idUsuario = 1;

  bool get isLoading => _isLoading;
  int get idUsuario => _idUsuario;

  set isLoading(bool value) {
    _isLoading = value;
    notifyListeners();
  }

  set idUsuario(int value) {
    _idUsuario = value;
    notifyListeners();
  }
}
