class CuentaVista {
  CuentaVista({
    required this.idCuentaVista,
    required this.numeroCuenta,
    required this.tipoCuenta,
    required this.saldoDisponible,
    required this.saldoContable,
    required this.idUsuario,
  });
  late final int idCuentaVista;
  late final String numeroCuenta;
  late final String tipoCuenta;
  late final String saldoDisponible;
  late final String saldoContable;
  late final int idUsuario;

  CuentaVista.fromJson(Map<String, dynamic> json) {
    idCuentaVista = json['id_cuenta_vista'];
    numeroCuenta = json['numero_cuenta'];
    tipoCuenta = json['tipo_cuenta'];
    saldoDisponible = json['saldo_disponible'];
    saldoContable = json['saldo_contable'];
    idUsuario = json['id_usuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id_cuenta_vista'] = idCuentaVista;
    _data['numero_cuenta'] = numeroCuenta;
    _data['tipo_cuenta'] = tipoCuenta;
    _data['saldo_disponible'] = saldoDisponible;
    _data['saldo_contable'] = saldoContable;
    _data['id_usuario'] = idUsuario;
    return _data;
  }
}
