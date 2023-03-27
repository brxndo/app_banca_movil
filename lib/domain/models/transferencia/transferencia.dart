class Transferencia {
  Transferencia({
    required this.numeroCuentaOrigen,
    required this.numeroCuentaDestino,
    required this.motivo,
    required this.fecha,
    required this.monto,
    required this.id_usuario,
    required this.id_cuenta_vista,
    required this.idCuentaDestino,
  });
  late final String numeroCuentaOrigen;
  late final String numeroCuentaDestino;
  late final String motivo;
  late final String fecha;
  late final String monto;
  late final int id_usuario;
  late final int id_cuenta_vista;
  late final int idCuentaDestino;

  Transferencia.fromJson(Map<String, dynamic> json) {
    numeroCuentaOrigen = json['numeroCuentaOrigen'];
    numeroCuentaDestino = json['numeroCuentaDestino'];
    motivo = json['motivo'];
    fecha = json['fecha'];
    monto = json['monto'];
    id_usuario = json['id_usuario'];
    id_cuenta_vista = json['id_cuenta_vista'];
    idCuentaDestino = json['idCuentaDestino'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['numeroCuentaOrigen'] = numeroCuentaOrigen;
    _data['numeroCuentaDestino'] = numeroCuentaDestino;
    _data['motivo'] = motivo;
    _data['fecha'] = fecha;
    _data['monto'] = monto;
    _data['id_usuario'] = id_usuario;
    _data['id_cuenta_vista'] = id_cuenta_vista;
    _data['idCuentaDestino'] = idCuentaDestino;
    return _data;
  }
}
