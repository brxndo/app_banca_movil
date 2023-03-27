class CuentasInversion {
  CuentasInversion({
    required this.idCuentaInversion,
    required this.numeroCuenta,
    required this.tipoCredito,
    required this.cuotasTotal,
    required this.montoTotal,
    required this.fechaFin,
    required this.idUsuario,
  });
  late final int idCuentaInversion;
  late final String numeroCuenta;
  late final String tipoCredito;
  late final String cuotasTotal;
  late final String montoTotal;
  late final String fechaFin;
  late final int idUsuario;

  CuentasInversion.fromJson(Map<String, dynamic> json) {
    idCuentaInversion = json['idCuentaInversion'];
    numeroCuenta = json['numeroCuenta'];
    tipoCredito = json['tipoCredito'];
    cuotasTotal = json['cuotasTotal'];
    montoTotal = json['montoTotal'];
    fechaFin = json['fechaFin'];
    idUsuario = json['id_usuario'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['idCuentaInversion'] = idCuentaInversion;
    _data['numeroCuenta'] = numeroCuenta;
    _data['tipoCredito'] = tipoCredito;
    _data['cuotasTotal'] = cuotasTotal;
    _data['montoTotal'] = montoTotal;
    _data['fechaFin'] = fechaFin;
    _data['id_usuario'] = idUsuario;
    return _data;
  }
}
