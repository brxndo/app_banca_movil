class CuentaDestino {
  CuentaDestino({
    required this.idCuentaDestino,
    required this.numeroCuenta,
    required this.esExterna,
    required this.nombreTitular,
    required this.identificacionTitular,
    required this.email,
    required this.comentario,
    required this.idUsuario,
  });
  late final int idCuentaDestino;
  late final String numeroCuenta;
  late final bool esExterna;
  late final String nombreTitular;
  late final String identificacionTitular;
  late final String email;
  late final String comentario;
  late final int idUsuario;

  CuentaDestino.fromJson(Map<String, dynamic> json) {
    idCuentaDestino = json['idCuentaDestino'];
    numeroCuenta = json['numeroCuenta'];
    esExterna = json['esExterna'];
    nombreTitular = json['nombreTitular'];
    identificacionTitular = json['identificacionTitular'];
    email = json['email'];
    comentario = json['comentario'];
    idUsuario = json['id_usuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idCuentaDestino'] = idCuentaDestino;
    _data['numeroCuenta'] = numeroCuenta;
    _data['esExterna'] = esExterna;
    _data['nombreTitular'] = nombreTitular;
    _data['identificacionTitular'] = identificacionTitular;
    _data['email'] = email;
    _data['comentario'] = comentario;
    _data['id_usuario'] = idUsuario;
    return _data;
  }
}
